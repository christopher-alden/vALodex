class Comment {
  String text;

  Comment(this.text);
}

class AgentComments {
  List<Comment> comments = [];

  void addComment(String text) {
    comments.add(Comment(text));
  }

  List<Comment> getComments() {
    return comments;
  }

  void clearComments() {
    comments.clear();
  }
}

class CommentState {
  CommentState._privateConstructor();

  static final CommentState _instance = CommentState._privateConstructor();

  static CommentState get instance => _instance;

  Map<String, AgentComments> _agentsComments = {};

  void addComment(String agent, String comment) {
    _agentsComments.putIfAbsent(agent, () => AgentComments()).addComment(comment);
  }

  List<Comment> getCommentsForAgent(String agent) {
    return _agentsComments[agent]?.getComments() ?? [];
  }

  void clearCommentsForAgent(String agent) {
    _agentsComments[agent]?.clearComments();
  }
}

