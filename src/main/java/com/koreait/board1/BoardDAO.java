package com.koreait.board1;

import java.sql.*;
import java.util.*;

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

    public static List<BoardVO> selBoardList() {
        List<BoardVO> list = new ArrayList();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = " SELECT iboard, title, writer, rdt FROM t_board1 " +
                    " ORDER BY iboard DESC ";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while(rs.next()) { //true, false
                int iboard = rs.getInt("iboard");
                String title = rs.getString("title");
                String writer = rs.getString("writer");
                String rdt = rs.getString("rdt");
                BoardVO vo = new BoardVO();
                vo.setIboard(iboard);
                vo.setTitle(title);
                vo.setWriter(writer);
                vo.setRdt(rdt);
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtils.close(con, ps, rs);
        }
        return list;
    }
}
