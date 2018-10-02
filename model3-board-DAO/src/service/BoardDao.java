package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {
	private final String driverClassName = "com.mysql.jdbc.Driver";
	private	final String	url	="jdbc:mysql://skok.kr:3306/injava?useUnicode=true&characterEncoding=euckr";
	private final String username = "dongbu";
	private final String password = "0000";

	///���̺� : board . ��� : ������ ����
	public int updateBoard(Board board) {
		int rowCount = 0;
		Connection connection = null;
		PreparedStatement statement = null;
		String sql = "UPDATE freeboard SET board_subject=?, board_content=?, board_reg=?, board_imgSize=?, board_fileName=? WHERE no=? AND board_pw=?";
		try {
			connection = this.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1,board.getBoardSubject());
			statement.setString(2,board.getBoardContent());
			statement.setString(3,board.getBoardreg());
			statement.setInt(4,board.getBoardImg());
			statement.setString(5,board.getBoardfileName());
			statement.setInt(6,board.getBoardNo());
			statement.setString(7,board.getBoardPw());
			rowCount = statement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(connection, statement, null);
		}
		return rowCount;
	}
		// ���̺� : board , ��� : ������ ����
	public int deleteBoard(Board board) {
		int rowCount = 0;
		Connection connection = null;
		PreparedStatement statement = null;
		String sql = "DELETE FROM freeboard WHERE no=? AND board_pw=?";
		try {
			connection = this.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setInt(1,board.getBoardNo());
			statement.setString(2,board.getBoardPw());
			rowCount = statement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(connection, statement, null);
		}
		return rowCount;
	}

	// ���̺� : board , ��� : �ϳ��� ������ ��������
	public Board selectBoardByKey(int boardNo) {
		Board board = null;
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultset = null;
		String sql = "SELECT board_subject, board_content, board_reg, board_user, board_hit, board_imgSize, board_fileName FROM freeboard WHERE no=?";
		try {
			connection = this.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setInt(1,boardNo);
			resultset = statement.executeQuery();
	  		if(resultset.next()) {
				board = new Board();
				board.setBoardNo(boardNo);
				board.setBoardSubject(resultset.getString("board_subject"));
				board.setBoardContent(resultset.getString("board_content"));
				board.setBoardreg(resultset.getString("board_reg"));
				board.setBoardUser(resultset.getString("board_user"));
				board.setBoardHit(resultset.getString("board_hit"));
				board.setBoardImg(resultset.getInt("board_imgSize"));
				board.setBoardfileName(resultset.getString("board_fileName"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(connection, statement, resultset);
		}
		return board;
	}

	// ���̺� : board , ��� : �� �������� ������ ��������
	public List<Board> selectBoardListPerPage(int beginRow, int pagePerRow) {
		List<Board> list = new ArrayList<Board>();
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultset = null;
		String sql = "SELECT no, board_subject, board_content, board_reg, board_user, board_hit, board_imgSize, board_fileName FROM freeboard WHERE board_reg = '2018-09-19' ORDER BY no DESC LIMIT ?, ?";
		try {
			connection = this.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setInt(1, beginRow);
			statement.setInt(2, pagePerRow);
			resultset = statement.executeQuery();
			while(resultset.next()) {
				Board board = new Board();
				board.setBoardNo(resultset.getInt("no"));
				board.setBoardSubject(resultset.getString("board_subject"));
				board.setBoardContent(resultset.getString("board_content"));
				board.setBoardreg(resultset.getString("board_reg"));
				board.setBoardUser(resultset.getString("board_user"));
				board.setBoardHit(resultset.getString("board_hit"));
				board.setBoardImg(resultset.getInt("board_imgSize"));
				board.setBoardfileName(resultset.getString("board_fileName"));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(connection, statement, resultset);
		}
		return list;
	}

	// ���̺� : board, ��� : ��ü �ο� ī���� ��������
	public int selectTotalBoardCount() {
		int rowCount = 0;
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultset = null;
		String sql = "SELECT COUNT(*) FROM freeboard";
		try {
			connection = this.getConnection();
			statement = connection.prepareStatement(sql);
			resultset = statement.executeQuery();
			if(resultset.next()) {
				rowCount = resultset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(connection, statement, resultset);
		}
		return rowCount;
	}

	//���̺� : board , ��� : ������ �Է��ϱ�
	public int insertBoard(Board board) {
		int rowCount = 0;
		Connection connection = null;
		PreparedStatement statement = null;
		String sql = "INSERT INTO freeboard(board_pw, board_subject, board_content, board_user, board_reg, board_imgSize, board_fileName) values(?,?,?,?,now(),?,?)";
		try {
			connection = this.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1,board.getBoardPw());
			statement.setString(2,board.getBoardSubject());
			statement.setString(3,board.getBoardContent());
			statement.setString(4,board.getBoardUser());
			statement.setInt(5,board.getBoardImg());
			statement.setString(6,board.getBoardfileName());
			rowCount = statement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(connection, statement, null);
		}
		return rowCount;
	}

	private Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName(this.driverClassName);
			connection	=	DriverManager.getConnection(this.url, this.username, this.password);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

	private void close(Connection connection, Statement statement, ResultSet
resultset) {
		if(resultset != null) {
			try {
				resultset.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}