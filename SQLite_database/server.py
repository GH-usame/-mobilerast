from flask import Flask, request, jsonify
import os
import signal


app = Flask(__name__)

# Flask sunucuyu kapatma endpoint'i
@app.route('/shutdown', methods=['POST'])
def shutdown():
    print('Flask sunucu kapatılıyor...')
    os.kill(os.getpid(), signal.SIGINT)
    return 'Flask sunucu kapatılıyor...'


# Yeni task ekleme endpoint'i
@app.route('/addTask', methods=['POST'])
def addTask_metodu():
    from databaseOperations import addTask 
    try:
        data = request.get_json()
        # tableName=data['tableName']
        taskname = data['taskname']
        desc = data['desc']
        status = data['status']
        assig = data['assigned']
        date_ = data['date']
        color=data["color"]
         # Görev eklemek için veritabanı metodunu çağırma
        addTask(status= str(status),task_name= str(taskname),description= str(desc),assigned=str(assig),date=str(date_),color=color)
        return jsonify({'sonuc':'data has been added'}), 200
    except Exception as e:
        print({'error': str(e)})
        return jsonify({'error': str(e)}), 500

# taskları okuma endpoint'i
@app.route('/readTasks', methods=['POST'])
def readTask_metodu():
    from databaseOperations import readTask 
    try:
        data = request.get_json()
        status=data['status']
         # veritabanınden taskı okuma metodunu çağırma
        sonuc= readTask(status)
        return jsonify({'sonuc':sonuc}), 200
    except Exception as e:
        print({'error': str(e)})
        return jsonify({'error': str(e)}), 500
    
# taskı güncelleme endpoint'i json olarak okur ve json olarak döndürür
@app.route('/updateTasks', methods=['POST'])
def updateTask_metodu():
    from databaseOperations import update_by_id 
    try:
        data = request.get_json()
        id = data['id']
        status = data['status']
        date_ = data['date']
        color=data["color"]
        update_by_id(status = str(status),id_to_update= int(id),myDate=str(date_),color=color)
        return jsonify({'sonuc':'data has been updated'}), 200
    except Exception as e:
        print({'error': str(e)})
        return jsonify({'error': str(e)}), 500

# run local server  
# Flask sunucuyu çalıştırma
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
