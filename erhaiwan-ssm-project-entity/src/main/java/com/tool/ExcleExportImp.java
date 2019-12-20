package com.tool;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import org.apache.poi.ss.usermodel.Workbook;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

public class ExcleExportImp {
    public static void exportExcel(Collection<?> listData, Class<?> pojoClass, String headTitle, String sheetName,HttpServletResponse response) {
        ExportParams params = new ExportParams(headTitle, sheetName);
        params.setHeight((short) 8);
        params.setStyle(ExcelExportMyStylerImpl.class);
        try {
            Workbook workbook = ExcelExportUtil.exportExcel(params, pojoClass, listData);
            String fileName = headTitle + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
            fileName = URLEncoder.encode(fileName, "UTF8");
            response.setContentType("application/vnd.ms-excel;chartset=utf-8");
            response.setHeader("Content-Disposition", "attachment;filename="+fileName + ".xls");
            ServletOutputStream out=response.getOutputStream();
            workbook.write(out);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
