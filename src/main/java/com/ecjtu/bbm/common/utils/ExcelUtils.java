package com.ecjtu.bbm.common.utils;

import com.ecjtu.bbm.common.constants.CommonConstants;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * @description:
 * @author: xu_pf@suixingpay.com
 * @date: 2018/2/5
 */
public class ExcelUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(ExcelUtils.class);
    /**
     * 文件名称
     */
    private String fileName;
    /**
     * 表格表头字段集
     */
    private ArrayList<String> fieldNameList;
    /**
     * 工作簿对象
     */
    private SXSSFWorkbook workbook;

    public ExcelUtils(String fileName, ArrayList<String> fieldNameList) {
        this.fileName = fileName;
        this.fieldNameList = fieldNameList;
        this.workbook = new SXSSFWorkbook(1000);
    }

    public SXSSFWorkbook getWorkbook() {
        return workbook;
    }

    /**
     * 将数据导入Excel
     *
     * @param sheetPage     sheet页码
     * @param fieldDataList 数据集
     * @return SXSSFWorkbook
     */
    public SXSSFWorkbook insertDataToExcel(int sheetPage, ArrayList<ArrayList<String>> fieldDataList) {
        // 创建sheet对象
        Sheet sheet = workbook.createSheet(fileName + sheetPage);
        // 创建行（0：第一行，此处为表头即标题行）
        Row headRow = sheet.createRow(0);
        // 设置每列标题行的内容
        for (int i = 0; i < fieldNameList.size(); i++) {
            Cell cell = headRow.createCell(i);
            // 设置每列的宽度
            sheet.setColumnWidth(i, 5000);
            // 创建列样式对象
            CellStyle cellStyle = workbook.createCellStyle();
            // 创建字体对象
            Font font = workbook.createFont();
            // 设置字体样式
            font.setBoldweight(Font.BOLDWEIGHT_BOLD);
            font.setFontName("宋体");
            cellStyle.setFont(font);
            // 添加样式
            cell.setCellType(Cell.CELL_TYPE_STRING);
            if (fieldNameList.get(i) != null) {
                cell.setCellStyle(cellStyle);
                cell.setCellValue(fieldNameList.get(i));
            } else {
                cell.setCellValue("-");
            }
        }
        // 分页处理导入Excel中的数据，并导入相应的列中
        for (int i = 0; i < fieldDataList.size(); i++) {
            Row row = sheet.createRow(i + 1);
            ArrayList<String> rowList = fieldDataList.get(i);
            for (int j = 0; j < rowList.size(); j++) {
                Cell cell = row.createCell(j);
                if (rowList.get(j) != null) {
                    cell.setCellValue(rowList.get(j));
                } else {
                    cell.setCellValue("");
                }
            }
        }
        return workbook;
    }

    public void downloadExcel(ExcelUtils excelUtils, String fileName, HttpServletResponse response) {
        OutputStream out = null;
        try {
            response.addHeader("Content-Disposition", "attachment;filename="
                    + new String(fileName.getBytes(), "iso8859-1") + ".xlsx");
            out = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            excelUtils.getWorkbook().write(out);
        } catch (Exception e) {
            LOGGER.error("系统异常", e);
        } finally {
            if (out != null) {
                try {
                    out.flush();
                    out.close();
                } catch (IOException e) {
                    LOGGER.error(e.getMessage(), e);
                }
            }
        }
    }

    /**
     * Excel导出限制条数
     *
     * @param count     查询出的数量
     * @param fileName  文件名
     * @return          String
     */
    public static String outLimit(int count,String fileName){
        String result = null;
        if (count == 0){
            LOGGER.error(fileName+"查询数据为空");
            result = fileName + "查询结果为空，导出失败";
        }
        if (count > CommonConstants.EXCEL_LIMIT_NUMBER){
            LOGGER.error(fileName + "导出数量超过" + CommonConstants.EXCEL_LIMIT_NUMBER);
            result = fileName + "导出数量超过" + CommonConstants.EXCEL_LIMIT_NUMBER + "，导出失败";
        }
        return result;
    }

    /**
     * 格式化日期、时间
     *
     * @param date  Date
     * @return      String
     */
    public static String formatDate(Date date){
        String result = null;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        result = simpleDateFormat.format(date);
        return result;
    }
}
