package com.kbstar.service;

import com.kbstar.dto.ProductDTO;
import com.kbstar.frame.MyDao;
import com.kbstar.frame.MyService;

import java.util.List;

public class ProductService implements MyService<String, ProductDTO> {
    MyDao<String, ProductDTO> dao;
    public ProductService(MyDao dao){
        this.dao=dao;
    }
    @Override
    public void register(ProductDTO productDTO) {
        dao.insert(productDTO);
    }

    @Override
    public void remove(String s) {
        dao.delete(s);
    }

    @Override
    public void modify(String s) {
        dao.update(s);
    }

    @Override
    public ProductDTO get(String s) {
        return dao.select(s);
    }

    @Override
    public List<ProductDTO> get() {
        return dao.select();
    }
}
