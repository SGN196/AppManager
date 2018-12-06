package com.caiqian.mapper;

import com.caiqian.Bean.DataDictionary;

import java.util.List;

public interface DataDictionaryMapper {

    List<DataDictionary> queryAllAppStatus();

    List<DataDictionary> queryAllAppFlatforms();
}