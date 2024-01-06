package a.b.c.vo;

public class ServiceVO {
    MemberVO mid;
    Integer usercnt;
    String kindof;
    String startdate;
    String enddate;
    String company;
    Integer phone;
    String email;
    Integer usage;

    public MemberVO getMid() {
        return mid;
    }

    public void setMid(MemberVO mid) {
        this.mid = mid;
    }

    public Integer getUsercnt() {
        return usercnt;
    }

    public void setUsercnt(Integer usercnt) {
        this.usercnt = usercnt;
    }

    public String getKindof() {
        return kindof;
    }

    public void setKindof(String kindof) {
        this.kindof = kindof;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getUsage() {
        return usage;
    }

    public void setUsage(Integer usage) {
        this.usage = usage;
    }
}
