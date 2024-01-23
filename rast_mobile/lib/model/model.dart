import 'package:rast_mobile/model/service.dart';

// Her bir durumu temsil eden listeler
List<Map> backlogList = [];
List<Map> toDoList = [];
List<Map> inprogressList = [];
List<Map> doneList = [];

// Tüm görev listelerini güncelleyen fonksiyon
getItemList() async {
  backlogList = await MyService().readTasks("Backlog");
  toDoList = await MyService().readTasks("ToDo");
  inprogressList = await MyService().readTasks("Inprogress");
  doneList = await MyService().readTasks("Done");
}

// Belirli bir görevin başlığını almak için fonksiyon
String getTaskTitle(int index, String type) {
  switch (type) {
    case "Backlog":
      return backlogList.isNotEmpty ? backlogList[index]["task_name"] : "";
    case "ToDo":
      return toDoList.isNotEmpty ? toDoList[index]["task_name"] : "";
    case "Inprogress":
      return inprogressList.isNotEmpty
          ? inprogressList[index]["task_name"]
          : "";
    case "Done":
      return doneList.isNotEmpty ? doneList[index]["task_name"] : "";
    default:
      return "";
  }
}

// Belirli bir görevin açıklamasını almak için fonksiyon
String getTaskdesc(int index, String type) {
  switch (type) {
    case "Backlog":
      return backlogList.isNotEmpty ? backlogList[index]["description"] : "";
    case "ToDo":
      return toDoList.isNotEmpty ? toDoList[index]["description"] : "";
    case "Inprogress":
      return inprogressList.isNotEmpty
          ? inprogressList[index]["description"]
          : "";
    case "Done":
      return doneList.isNotEmpty ? doneList[index]["description"] : "";
    default:
      return "";
  }
}

// Belirli bir görevin tarihini almak için fonksiyon
String getTaskDate(int index, String type) {
  switch (type) {
    case "Backlog":
      return backlogList.isNotEmpty ? backlogList[index]["date"] : "";
    case "ToDo":
      return toDoList.isNotEmpty ? toDoList[index]["date"] : "";
    case "Inprogress":
      return inprogressList.isNotEmpty ? inprogressList[index]["date"] : "";
    case "Done":
      return doneList.isNotEmpty ? doneList[index]["date"] : "";
    default:
      return "";
  }
}

// Belirli bir görevin rengini almak için fonksiyon
int getTaskColor(int index, String type) {
  switch (type) {
    case "Backlog":
      return backlogList.isNotEmpty
          ? int.parse(backlogList[index]["color"])
          : 4294967295;
    case "ToDo":
      return toDoList.isNotEmpty
          ? int.parse(toDoList[index]["color"])
          : 4294967295;
    case "Inprogress":
      return inprogressList.isNotEmpty
          ? int.parse(inprogressList[index]["color"])
          : 4294967295;
    case "Done":
      return doneList.isNotEmpty
          ? int.parse(doneList[index]["color"])
          : 4294967295;
    default:
      return 4294967295;
  }
}

// Belirli bir görevin durumunu ve rengini güncelleyen fonksiyon
updateItem(index, status, String color, bool onlyColor) async {
  if (onlyColor) {
    // Sadece renk güncelleniyorsa
    switch (status) {
      case "Backlog":
        await MyService().updateTask(status, backlogList[index]["id"], color);
        await getItemList();
      case "ToDo":
        await MyService().updateTask(status, toDoList[index]["id"], color);
        await getItemList();
      case "Inprogress":
        await MyService()
            .updateTask(status, inprogressList[index]["id"], color);
        await getItemList();
      case "Done":
        await MyService().updateTask(status, doneList[index]["id"], color);
        await getItemList();
    }
  } else {
    // Durum ve renk güncelleniyorsa
    switch (status) {
      case "Backlog":
        await MyService().updateTask("ToDo", backlogList[index]["id"], color);
        await getItemList();
      case "ToDo":
        await MyService()
            .updateTask("Inprogress", toDoList[index]["id"], color);
        await getItemList();
      case "Inprogress":
        await MyService()
            .updateTask("Done", inprogressList[index]["id"], color);
        await getItemList();
      case "Done":
        await MyService().updateTask("Backlog", doneList[index]["id"], color);
        await getItemList();
    }
  }
}
