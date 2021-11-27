package com.koreait.board1;

import java.sql.*;

// DAO : Data Access Object
public class BoardDAO {
    public static int insBoard(BoardVO param) {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "INSERT INTO t_board1 (title, ctnt, writer) " +
                "VALUES (?, ?, ?)";
        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, param.getTitle());
            ps.setString(2, param.getCtnt());
            ps.setString(3, param.getWriter());
            return ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        finally { DbUtils.close(con, ps); }
        return 0;
    }
}
