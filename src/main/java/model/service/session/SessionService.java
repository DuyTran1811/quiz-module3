package model.service.session;

import model.DBConnector;
import model.entities.Question;
import model.entities.QuestionAnswer;
import model.entities.QuizTable;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SessionService {
    private final String GET_ALL_QUIZ = "SELECT qz.id as id, qz.name as quizName, qz.difficulty as difficulty, u.name as author from quiz qz join user u on qz.id_user = u.id";
    private final String GET_ALL_QUESTION = "SELECT q.id, q.content from question q join quiz qz on qz.id = q.id_quiz where qz.id = ?";
    private final String GET_QUESTION_ANSWER = "SELECT a.id, a.content from answer a join question q on q.id = a.id_question where q.id = ?";
    public List<QuizTable> findAll() {
        List<QuizTable> quizes = new ArrayList<>();
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement ps = connection.prepareStatement(GET_ALL_QUIZ)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("quizName");
                String difficulty = rs.getString("difficulty");
                String author = rs.getString("author");
                quizes.add(new QuizTable(id, name, difficulty, author));
            }
        } catch (SQLException e) {

        }
        return quizes;
    }

    public List<QuestionAnswer> findAllQuestion(int id) {
        List<QuestionAnswer> questions = new ArrayList<>();
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement ps = connection.prepareStatement(GET_ALL_QUESTION)) {
            String idTrue = String.valueOf(id);
            ps.setString(1, idTrue);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idQuestion = rs.getInt(1);
                String contentQuestion = rs.getString(2);
                QuestionAnswer qa = new QuestionAnswer();
                qa.setId(idQuestion);
                qa.setQuestion(contentQuestion);
                questions.add(qa);
            }
            int counter = 0;
            for (QuestionAnswer qa:questions) {
                PreparedStatement ps2 = connection.prepareStatement(GET_QUESTION_ANSWER);
                ps2.setInt(1, qa.getId());
                ResultSet rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    counter ++;
                    String answer = rs2.getString(2);
                    switch (counter) {
                        case 1:
                            qa.setAnswer1(answer);
                            break;
                        case 2:
                            qa.setAnswer2(answer);
                            break;
                        case 3:
                            qa.setAnswer3(answer);
                            break;
                        case 4:
                            qa.setAnswer4(answer);
                            counter = 0;
                            break;
                    }
                }
            }
        } catch (SQLException e) {

        }
        return questions;
    }
}
