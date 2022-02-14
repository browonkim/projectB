import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TodoDao {
    private static final String dbURL = "jdbc:mysql://localhost:3306/connectdb";
    private static final String dbUser = "user";
    private static final String dbPassword = "abcd1234!";

    public TodoDao() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public int addTodo(TodoDto todo) {

        int insertCount = 0;

        String sql = "INSERT INTO todo (title, name, sequence, type) VALUES (?,?,?,?)";
        try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, todo.getTitle());
            ps.setString(2, todo.getName());
            ps.setInt(3, todo.getSequence());
            ps.setString(4, todo.getType());

            insertCount = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return insertCount;
    }

    public List<TodoDto> getTodo() {

        List<TodoDto> resultList = new ArrayList<>();

        String sql = "SELECT id, name, title, type, sequence, regdate FROM todo ORDER BY regdate";
        try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
             PreparedStatement ps = con.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {

                    Long id = rs.getLong("id");
                    String name = rs.getString("name");
                    String title = rs.getString("title");
                    int sequence = rs.getInt("sequence");
                    String type = rs.getString("type");
                    String regDate = rs.getTimestamp("regdate").toString();

                    resultList.add(new TodoDto(id, name, regDate, sequence, title, type));

                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultList;
    }

    public int updateTodo(TodoDto todo) {

        int updateCount = 0;

        String sql = "UPDATE todo SET sequence=? WHERE id=?";
        try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, todo.getSequence());
            ps.setLong(2, todo.getId());

            updateCount = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updateCount;
    }


}
