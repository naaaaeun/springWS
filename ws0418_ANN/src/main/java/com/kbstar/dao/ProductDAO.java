package com.kbstar.dao;

import com.kbstar.dto.ProductDTO;
import com.kbstar.frame.MyDao;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository("pdao")
public class ProductDAO implements MyDao<String, ProductDTO> {
    @Override
    public void insert(ProductDTO productDTO) {
        System.out.println("inserted oracle "+productDTO);
    }

    @Override
    public void delete(String s) {
        System.out.println("deleted oracle "+s);

    }

    @Override
    public void update(String s) {
        System.out.println("updated oracle "+s);
    }

    @Override
    public ProductDTO select(String s) {
        ProductDTO product= null;
        product = new ProductDTO("id01", "product", 100, 10);
        return product;
    }

    @Override
    public List<ProductDTO> select() {
        List<ProductDTO> list = new ArrayList<>();
        list.add(new ProductDTO("id01", "product", 100, 10));
        return list;
    }
}
