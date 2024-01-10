package a.b.c.dao;

import a.b.c.vo.ServiceVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ServiceDAO {

    void insertService(ServiceVO service);

    ServiceVO findServiceByUserId(String mid);

}
