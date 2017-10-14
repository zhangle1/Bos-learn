package com.zhangle.bos.dao;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/10/14.
 */
public interface IBaseDao<T> {


        public void save(T entity);

        public  void delete(T entity);

        public void update(T entity);

        public T findById(Serializable id);

        public List<T> findAll();




}
