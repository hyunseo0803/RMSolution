package a.b.c.vo;

import java.time.LocalDateTime;

public class FileVO {
    int num;
    String mid;
    String filename;
    String filepath;
    String datetime;

    int size;

    String convertsize;


    public String getConvertsize() {
        return convertsize;
    }

    public void setConvertsize(String convertsize) {
        this.convertsize = convertsize;
    }


    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }


}
