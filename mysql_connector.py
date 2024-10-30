import mysql.connector
import tkinter as tk
from tkinter import ttk

class my_database:
    def __init__(self, root):
        self.root = root
        self.root.title("R6S Database")
        
        self.db_config = {
            "host": "localhost",
            "user": "root",
            "password": ,
            "database": "r6s",
        }
            
        self.connection = mysql.connector.connect(**self.db_config)
        self.cursor = self.connection.cursor()
        self.create_widgets()
        
    def create_widgets(self):
        self.query_label = ttk.Label(self.root, text='Enter your SQL query:')
        self.query_label.grid(row=0, column=0, padx=10, pady=10)
        
        self.query_entry = ttk.Entry(self.root, width=50)
        self.query_entry.grid(row=0, column=1, padx=10, pady=10)
        
        self.execute_button = ttk.Button(self.root, text='Execute Query', command=self.execute_query)
        self.execute_button.grid(row=0, column=2, padx=10, pady=10)
        

        self.tree = ttk.Treeview(self.root, columns=("Column 1", "Column 2", "Column 3")) 
        self.tree.grid(row=1, column=0, columnspan=3, padx=10, pady=10, sticky="nsew")

        vsb = ttk.Scrollbar(self.root, orient="vertical", command=self.tree.yview)
        vsb.grid(row=1, column=3, sticky="ns")
        self.tree.configure(yscrollcommand=vsb.set)
        
        # hsb = ttk.Treeview(self.root, orient="horizontal", command=self.tree.xview)
        # hsb.grid(row=2, column=0, sticky="ew")
        # self.tree.configure(xscrollcommand=hsb.set)

        # this allows my display box in the GUI to dynamically change according to the size of the table data being displayed
        self.root.grid_rowconfigure(1, weight=1) 
        self.root.grid_columnconfigure(0, weight=1)
        self.root.grid_columnconfigure(1, weight=1)
        self.root.grid_columnconfigure(2, weight=1)

    def execute_query(self):
        query = self.query_entry.get()

        try:
            self.cursor.execute(query)
            results = self.cursor.fetchall()

            for item in self.tree.get_children(): #to avoid overwriting of data 
                self.tree.delete(item)

        
            column_names = [desc[0] for desc in self.cursor.description] #respective column names in the table
            self.tree["columns"] = column_names
            for col in column_names:
                self.tree.heading(col, text=col)

            
            for row in results:
                self.tree.insert("", "end", values=row) #displaying results in tabulfar form 

            self.connection.commit()
        except Exception as e:
            print(f"Error: {e}")


if __name__ == "__main__":
    root = tk.Tk()
    app = my_database(root)
    root.mainloop()


