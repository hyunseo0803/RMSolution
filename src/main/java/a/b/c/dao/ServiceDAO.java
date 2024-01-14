package a.b.c.dao;

import a.b.c.vo.ServiceVO;
import org.apache.ibatis.annotations.Mapper;
import java.time.LocalDate;

@Mapper
public interface ServiceDAO {

    void insertService(ServiceVO service);

    void saveNewEnddate(LocalDate newenddate, String mid);

    void saveNewVolume(String mid, int newvolume);

    Integer sumUsageById(String mid);

    ServiceVO findServiceByUserId(String mid);


}
