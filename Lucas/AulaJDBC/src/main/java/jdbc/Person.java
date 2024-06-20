package jdbc;

public class Person {
    private int personId;
    private String name;
    private String email;

    public Person() {}

    public Person(String name, String email) {

        this.name = name;
        this.email = email;
    }

    public Person(int personpersonId, String name, String email) {
        this.personId = personpersonId;
        this.name = name;
        this.email = email;
    }

    public int getpersonId() {
        return personId;
    }

    public void setpersonId(int personId) {
        this.personId = personId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return
                "personId : " + personId +
                ", name: " + name +
                ", email : " + email;
    }
}
