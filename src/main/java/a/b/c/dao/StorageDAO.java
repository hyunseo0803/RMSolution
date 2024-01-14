package a.b.c.dao;

import a.b.c.vo.FileVO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface StorageDAO {

    void save(FileVO fileVO);

    void deleteFile(int num);

    List<FileVO> findAllFileById(String mid);

    FileVO selectFileInfo(int num);


}
