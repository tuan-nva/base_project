class TextAppData {
  static List<TextDataValue> textValues = [
    TextDataValue(key: "title", value: "Base Project"),
    TextDataValue(key: "app", value: "Base Project"),
    TextDataValue(key: "login", value: "Đăng nhập"),
    TextDataValue(
      key: "userProfileExpired",
      value:
          "Tài khoản đã hết hạn đăng nhập. Xin quý khách vui lòng đăng nhập lại.",
    ),
    TextDataValue(key: "returnLogin", value: "Tới màn hình đăng nhập"),
    TextDataValue(key: "userName", value: "Mã đăng nhập"),
    TextDataValue(key: "password", value: "Mật khẩu"),
    TextDataValue(key: "logout", value: "Đăng xuất"),
    TextDataValue(key: "actionSuccess", value: "Lưu thông tin"),
    TextDataValue(
      key: "actionSuccessDetail",
      value: "Dữ liệu đã được cập nhật vào hệ thống",
    ),
    TextDataValue(
      key: "actionErrorDetail",
      value:
          "Có lỗi trong quá trình thực hiện. Xin bạn vui lòng kiểm tra thông tin và thử thực hiện lại.",
    ),
    TextDataValue(key: "typeInput", value: "Nhập nội dung"),
    TextDataValue(key: "profile", value: "Thông tin tài khoản"),
    TextDataValue(key: "fullName", value: "Họ và tên"),
    TextDataValue(key: "email", value: "Email"),
    TextDataValue(key: "phone", value: "Điện thoại"),
    TextDataValue(key: "address", value: "Địa chỉ"),
    TextDataValue(key: "edit", value: "Chỉnh sửa thông tin"),
    TextDataValue(key: "save", value: "Lưu thông tin"),
    TextDataValue(key: "cancelEdit", value: "Huỷ chỉnh sửa"),
    TextDataValue(key: "cancel", value: "Huỷ"),
    TextDataValue(key: "changeAccount", value: "Cập nhật tài khoản"),
    TextDataValue(key: "oldPassword", value: "Mật khẩu hiện tại"),
    TextDataValue(key: "newPassword", value: "Mật khẩu mới"),
    TextDataValue(key: "setting", value: "Thiết lập"),
    TextDataValue(key: "chooseTenant", value: "Nhấn chọn Tổ chức"),
    TextDataValue(key: "message", value: "Tin nhắn"),
    TextDataValue(key: "titleChat", value: " - Chat"),
    TextDataValue(key: "chatChannelId", value: "Chat"),
    TextDataValue(key: "chatChannelName", value: "Chat"),
    TextDataValue(key: "chatChannelDescription", value: ""),
    TextDataValue(
      key: "chatTimer",
      value: "Thời gian định kỳ thông báo tin nhắn (giây)",
    ),
    TextDataValue(key: "joinClass", value: "Vào lớp"),
    TextDataValue(key: "home", value: "Trang chủ"),
    TextDataValue(key: "notify", value: "Thông báo"),
    TextDataValue(key: "class", value: "Lớp học"),
    TextDataValue(key: "usermanual", value: "Hướng dẫn sử dụng"),
    TextDataValue(key: "schedule", value: "Lịch học"),
    TextDataValue(key: "course", value: "Khóa học"),
    TextDataValue(key: "center", value: "Trung tâm"),
    TextDataValue(key: "subject", value: "Môn học"),
    TextDataValue(key: "lesson", value: "Bài học"),
    TextDataValue(key: "student", value: "Học sinh"),
    TextDataValue(key: "teacher", value: "Giáo viên"),
    TextDataValue(key: "tuitionFee", value: "Học phí"),
    TextDataValue(key: "statistical", value: "Thống kê"),
    TextDataValue(key: "viewTask", value: "Xem bài làm"),
    TextDataValue(key: "lessonDetail", value: "Chi tiết bài học"),
    TextDataValue(key: "academic_result", value: "Kết quả học tập"),
  ];

  static String getValue(String key) {
    var textValue =
        textValues.firstWhere((w) => w.key == key, orElse: () => null);
    if (textValue != null) {
      return textValue.value;
    }
    return key;
  }
}

class TextDataValue {
  final String key;
  final String value;

  TextDataValue({
    this.key,
    this.value,
  });
}
