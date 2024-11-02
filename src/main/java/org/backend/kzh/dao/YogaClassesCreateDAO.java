package org.backend.kzh.dao;

import org.backend.kzh.entities.YogaClasses;

public class YogaClassesCreateDAO {
    public YogaClassesCreateDAO()
    {

    }
    public YogaClassesCreateDAO(YogaClasses parent) {
        AdditionalComments = parent.getAdditionalComments(); 
        Date = parent.getDate();
        TeacherName = parent.getTeacherName();
        YogaId = parent.getYogaId();
    }

    public YogaClasses toYogaClasses()
    {
        YogaClasses parent = new YogaClasses();
        parent.setId(Id);
        parent.setAdditionalComments(AdditionalComments);
        parent.setDate(Date);
        parent.setTeacherName(TeacherName);
        return parent;
    }
    public String Id ;
    public String AdditionalComments ;
    public String Date ;
    public String TeacherName ;
    public String YogaId ;
}
