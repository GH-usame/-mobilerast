import sqlite3


# "Tasks" adlı tabloyu oluştur (SQLite)
def createTables():
    # Veritabanı bağlantısını oluştur
    conn = sqlite3.connect('mydatabase.db')
    cursor = conn.cursor()
    # Tablo 1
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS Tasks (
            id INTEGER PRIMARY KEY,
            status TEXT NOT NULL,
            task_name TEXT NOT NULL,
            description TEXT,
            date TEXT,
            assigned TEXT,
            color TEXT
        )
    ''')

    # Değişiklikleri kaydet ve bağlantıyı kapat
    conn.commit()
    conn.close()


# veritabana yeni task ekle
def addTask(status="", task_name="", description="",  assigned="", date="",color=""):
    try:
        # if no database create new database
        createTables()
        # Veritabanı bağlantısını oluştur
        conn = sqlite3.connect('mydatabase.db')
        cursor = conn.cursor()
        print(status)
        # Parametreleri kullanarak SQL sorgusunu oluştur
        sql_query = f"INSERT INTO Tasks (status,task_name, description,  assigned, date,color) VALUES (?, ?, ?,?, ?,?)"

        # Parametre değerlerini bir demet içinde sağla
        values = (status,task_name, description,  assigned, date,color)
        # SQL sorgusunu çalıştır
        cursor.execute(sql_query, values)

        # Değişiklikleri kaydet ve bağlantıyı kapat
        conn.commit()
        conn.close()

    except sqlite3.Error as e:
        print(f"SQLite hatası: {e}")
        # Hata durumunda gerekli işlemleri buraya ekleyebilirsiniz.

    except Exception as e:
        print(f"Beklenmeyen bir hata oluştu: {e}")
        # Diğer beklenmeyen hatalar için gerekli işlemleri buraya ekleyebilirsiniz.


# veritabanadan gelen status'a (todo ,done ..vs) göre taskları döndür 
def readTask(status):
    conn = sqlite3.connect('mydatabase.db')
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM Tasks where status like ? ",(status,))
    rows = cursor.fetchall()
    columns = [desc[0] for desc in cursor.description]
    tasks = []
    for row in rows:
        task_map = dict(zip(columns, row))
        tasks.append(task_map)
    conn.close()
   
    return tasks
 


# /// update status ve color in database
def update_by_id(status, id_to_update,myDate,color):
    try:
        # Connect to the SQLite database
        conn = sqlite3.connect('mydatabase.db')
        cursor = conn.cursor()
        # Execute the DELETE query using a parameterized query
        cursor.execute(f"update tasks set status =? ,color=? ,date=? WHERE id = ?", (status,color,myDate,id_to_update))

        # Commit the changes to the database
        conn.commit()

        print(f"Row with id {id_to_update} upadted successfully.")

    except sqlite3.Error as error:
        print(f"Error updateing data: {error}")

    finally:
        # Close the cursor and connection
        cursor.close()
        conn.close()


