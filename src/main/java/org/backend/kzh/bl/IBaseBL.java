package org.backend.kzh.bl;

import java.util.List;

import org.backend.kzh.dao.ResponseModel;

public interface IBaseBL<T,OUTTYPE,OUTDETAILTYPE> {
	ResponseModel<List<OUTTYPE>> getAll(String email);
    ResponseModel<OUTDETAILTYPE> getById(String id,String email);
    ResponseModel<String> insert(T model);
    ResponseModel<String> update(T model,String id);
    ResponseModel<String> deleteById(String id);
}
