package com.kewen.service;
import com.kewen.dao.TypeDao;
import com.kewen.model.Type;
import java.util.List;
public class TypeService {
    private TypeDao tDao = new TypeDao();

    public List<Type> getAllType() {
        List<Type> list = null;
        try {
            list = tDao.getAllType();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public Type selectTypeNameById(int id) {
        Type t = null;
        try {
            t = tDao.selectTypeNameById(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return t;
    }
}