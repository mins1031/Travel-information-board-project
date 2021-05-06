package kr.ncq.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.ncq.domain.BoardAttachDAO;
import kr.ncq.mapper.BoardAttachMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
@AllArgsConstructor
public class FileCheckTask {

	private BoardAttachMapper attachMapper;
	
	private String getFolderYesterDay() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cal = Calendar.getInstance();

		cal.add(Calendar.DATE, -1);

		String str = sdf.format(cal.getTime());

		return str.replace("-", File.separator);
	}
	
	
	@Scheduled(cron="0 0 0 3 * *")
	public void checkFiles()throws Exception{
		
		log.info("file check task run!");		
		log.info(new Date());
		
		List<BoardAttachDAO> fileList = attachMapper.getOldFiles();
		fileList.forEach(p -> log.info(p));
		
		List<Path> fileListPaths = fileList.stream().map(vo -> Paths.get("C:\\spring_file_upload",vo.getUploadPath(),
				vo.getUuid() + "_" + vo.getFileName())).collect(Collectors.toList());
		
		fileList.stream().filter(vo -> vo.isFileType() == true).map(vo -> Paths.get("C:\\spring_file_upload",vo.getUploadPath(),
				"s_" + vo.getUuid() + "_" + vo.getFileName())).forEach(p -> fileListPaths.add(p));
		
		log.info("===========================================");	
		
		fileListPaths.forEach(p -> log.info(p));

		// files in yesterday directory
		File targetDir = Paths.get("C:\\spring_file_upload", getFolderYesterDay()).toFile();

		log.warn(targetDir);
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		log.warn(removeFiles);
		log.warn("-----------------------------------------");
		for (File file : removeFiles) {

			log.warn(file.getAbsolutePath());

			file.delete();

		}
	}
}
