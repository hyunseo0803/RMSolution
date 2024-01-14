package a.b.c.vo;

import java.time.LocalDate;

public class ServiceVO {

    String mid;
    String username;
    String kindof;
    LocalDate startdate;
    LocalDate enddate;

    Integer month;
    String company;
    String phone;
    String email;
//    double usage;

    int volume;

    public Integer getVolume() {
        return volume;
    }

    public void setVolume(Integer volume) {
        this.volume = volume;
    }


    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getKindof() {
        return kindof;
    }

    public void setKindof(String kindof) {
        this.kindof = kindof;
    }

    public LocalDate getStartdate() {
        if (startdate == null) {
            return LocalDate.now();
        }
        return startdate;
    }

    public void setStartdate() {
        this.startdate = LocalDate.now();
    }

    public LocalDate getEnddate() {
        return enddate;
    }

    public void setEnddate(LocalDate enddate) {
        this.enddate = enddate;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
