import os
import os.path
import csv
import json
import tkinter as tk
from tkinter import filedialog, messagebox, font
import matplotlib
import matplotlib.cm as cm
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg, NavigationToolbar2Tk

matplotlib.use('TkAgg')  # falls das backend nicht automatisch gefunden wurde


class Plotwindow:
    """
    Eine Klasse zur Darstellung von Plots in einem eingebetteten Fenster.

    Diese Klasse erstellt ein Plot-Fenster, das in ein übergeordnetes tkinter-Fenster eingebettet ist.
    Sie ermöglicht das Erstellen, Anzeigen und Löschen von Plots mit verschiedenen Eigenschaften.

    :param masterframe: Das übergeordnete tkinter-Fenster, in das der Plot eingebettet wird.
    :param size: Die Größe des Plot-Fensters als Tupel (Breite, Höhe).

    Methoden:
        set_plot_font(): Legt die Schriftart für den Plot fest.
        plotxy(title, header, data, f_ext, colormap): Erstellt einen Plot mit den gegebenen Daten und Eigenschaften.
        clearplot(): Löscht den aktuellen Plot.
    """

    def __init__(self, masterframe, size):
        """
        Initialisiert die Plot-Window-Klasse.
        """
        # Erstellt ein Figure und Achsen für den Plot mit der angegebenen Größe 'size'
        self.figure, self.axes = plt.subplots(figsize=size)

        # Erzeugt eine Canvas-Fläche als Matplotlib-Zeichenbereich und bindet sie an das übergeordnete Masterframe
        self.canvas = FigureCanvasTkAgg(self.figure, master=masterframe)
        self.canvas.get_tk_widget().grid(row=1, column=0, sticky="nsew")

        # Ruft die Methode auf, um die Schriftart für den Plot festzulegen
        self.set_plot_font()

    # Statische Methoden sind an die Klasse gebunden und arbeiten unabhängig von Instanzdaten. Sie werden verwendet,
    # wenn eine Methode zur Klasse gehört, aber keine Instanzvariablen benötigt.
    @staticmethod
    def set_plot_font():
        """
        Legt die Schriftart für den Plot fest.
        """
        # Konfiguriert die Schriftart für den Plot mit 'Century Gothic', normaler Gewichtung und Schriftgröße 12
        plot_font = {'family': 'Century Gothic',
                     'weight': 'normal',
                     'size': 12}

        # Setzt die Schriftartkonfiguration für Matplotlib auf die definierten Werte
        matplotlib.rc('font', **plot_font)

    def plotxy(self, title, header, data, f_ext, colormap):
        """
        Erstellt einen Plot mit den gegebenen Daten und Eigenschaften.

        :param title: Titel des Plots.
        :param header: Achsenbeschriftungen.
        :param data: Zu plottende Daten als Liste von Einträgen.
        :param f_ext: Dateierweiterung der Datenquelle (".csv" oder ".json").
        :param colormap: Colormap für die Linienfarben.
        """
        # Leert die Achsen für einen neuen Plot, entfernt vorherige Inhalte
        self.axes.cla()

        # Ermittelt die Anzahl der Datenpunkte für die Farbgestaltung
        num_colors = len(data)

        # Liste zur Speicherung der Legenden-Handles für jede Linie im Plot
        handles = []

        # Iteriert über die Daten und erstellt separate Linien für jede Stadt/Landkreis
        for idx, entry in enumerate(data):
            x = header

            # Prozentsätze der aktuellen Stadt/des aktuellen Landkreises
            y = entry['percentages']
            color = colormap(idx / num_colors)

            # Zeichnet eine Linie für die aktuelle Stadt/Landkreis mit Marker 'o' und beschriftet sie in der Legende
            line, = self.axes.plot(x, y, marker="o", label=entry['city'], color=color)

            # Fügt die Linie zur Liste der Legenden-Handles hinzu
            handles.append(line)

        # Konfiguriert den Plot-Titel und die Achsenbeschriftungen
        self.axes.set_title(title)
        self.axes.set_xlabel("Jahr")
        self.axes.set_ylabel("% je Stadt/Landkreis")

        # Legt die Positionen der X-Tick-Markierungen und deren Beschriftungen fest
        self.axes.set_xticks(range(len(header)))
        self.axes.set_xticklabels(header)

        # Fügt Abstand zwischen Achsenbeschriftung und X-Tick-Beschriftungen hinzu
        self.axes.xaxis.labelpad = 10
        self.axes.yaxis.labelpad = 10

        # Fügt die Legende im oberen rechten Bereich des Plots hinzu
        self.axes.legend(handles=handles, loc='upper right')

        # Aktualisiert die Zeichenfläche, um den neuen Plot anzuzeigen
        self.canvas.draw()

    def clearplot(self):
        """
        Löscht den aktuellen Plot.
        """
        # Leert die Achsen für einen neuen Plot
        self.axes.cla()

        # Zeichnet den aktualisierten Plot im Canvas
        self.canvas.draw()


class ReadData:
    """
    Eine Klasse zum Einlesen von Daten aus Dateien.

    Diese Klasse ermöglicht das Laden von Daten aus ausgewählten Dateien (.csv oder .json)
    und deren Aufbereitung für die Verwendung in der Anwendung.

    Methoden:
        get_data(lab): Lädt die ausgewählte Datei und aktualisiert die Anzeige im Label.
        read_and_format_data(): Liest die Daten aus der ausgewählten Datei und gibt sie im geeigneten Format zurück.
    """

    def __init__(self):
        """
        Initialisiert die ReadData Klasse.
        """
        # Speichert den ausgewählten Dateinamen
        self.filename = ""

        # Speichert das Label-Widget
        self.lab = ""

    def get_data(self, lab):
        """
        Lädt die ausgewählte Datei und aktualisiert die Anzeige im Label.

        Diese Methode öffnet ein Dateiauswahlfenster und lädt die ausgewählte Datei.
        Sie überprüft, ob das Dateiformat (.csv oder .json) unterstützt wird.
        Bei einem ungültigen Format wird eine Warnung angezeigt und der Dateiname zurückgesetzt.

        :param lab: Das Label zur Anzeige der ausgewählten Datei.
        """
        # Öffnet das Dateiauswahlfenster und speichert den ausgewählten Dateinamen in 'self.filename'
        self.filename = filedialog.askopenfilename(initialdir="/Python/Projektarbeit", title="Datei öffnen:",
                                                   filetypes=(("csv Dateien", "*.csv"),
                                                              ("json Dateien", "*.json"),
                                                              ("Alle Dateitypen", "*.*")))

        # Überprüft, ob kein Dateiname ausgewählt wurde
        if not self.filename:
            return

        # Extrahiert den Dateinamen und die Dateierweiterung
        f_name, f_ext = os.path.splitext(self.filename)

        # Überprüft, ob die ausgewählte Datei ein unterstütztes Format hat
        supported_formats = ['.csv', '.json']
        if f_ext not in supported_formats:
            # Zeigt eine Warnung, wenn das Dateiformat nicht unterstützt wird
            messagebox.showwarning("Warnung",
                                   "Ungültiges Dateiformat ausgewählt.\nBitte wählen Sie eine .csv oder .json Datei.")

            # Setzt den Dateinamen bei ungültigem Format zurück
            self.filename = ""
            lab.config(text="Die ausgewählte Datei ist: " + self.filename)
            return

        # Aktualisiert das Label-Widget, um den ausgewählten Dateinamen anzuzeigen
        lab.config(text="Die ausgewählte Datei ist: " + self.filename)

    def read_and_format_data(self):
        """
        Liest die Daten aus der ausgewählten Datei und gibt sie im geeigneten Format zurück.

        :return: Eine Tupel bestehend aus (Titel, Achsenbeschriftungen, Daten, Dateierweiterung).
        """
        # Extrahiert den Dateinamen und die Dateierweiterung
        f_name, f_ext = os.path.splitext(self.filename)

        if f_ext == ".csv":
            # Für CSV-Dateien:
            # Initialisiert eine leere Liste zur Speicherung der extrahierten Daten
            data = []

            # Öffnet die ausgewählte CSV-Datei im Lesemodus und nutzt den csv-Modul-Reader
            with open(self.filename, newline="") as csv_file:
                reader_obj = csv.reader(csv_file, delimiter=";")

                # Extrahiert die Header-Zeile und verwendet sie als Achsenbeschriftungen
                header = next(reader_obj)

                # Extrahiert den Titel aus der ersten Zeile des Headers
                title = header[0]

                # Extrahiert die Achsenbeschriftungen (Jahre) aus den verbleibenden Header-Einträgen
                header_data = header[1:]

                # Durchläuft die Zeilen der CSV-Datei und extrahiert Daten für jede Stadt/jeden Landkreis
                for row in reader_obj:
                    city = row[0]

                    # Extrahiert Prozentsätze für jede Stadt/jeden Landkreis und speichert sie in einer Liste
                    percentages = [float(value.replace(',', '.')) if value != "" else None for value in row[1:]]
                    data.append({'city': city, 'percentages': percentages})

            return title, header_data, data, f_ext

        elif f_ext == ".json":
            # Für JSON-Dateien:
            # Lädt den Inhalt der ausgewählten JSON-Datei
            with open(self.filename) as f:
                cities_data = json.load(f)

            # Überprüft, ob die JSON-Struktur erwartet wird
            if "title" not in cities_data or "data" not in cities_data:
                raise ValueError("Ungültiges JSON-Format: Erwartete Schlüssel 'title' und 'data' fehlen.")

            # Extrahiert den Titel und die Daten aus dem JSON-Inhalt
            title = cities_data.get("title")
            header_data = []
            data = []

            # Durchläuft die Stadt-Daten in der JSON-Datei und extrahiert Informationen
            for city_data in cities_data.get("data", []):

                # Überprüft, ob erwartete Schlüssel in den Stadt-Daten vorhanden sind
                if "Stadt" not in city_data or not any(key.isdigit() for key in city_data.keys()):
                    raise ValueError(
                        "Ungültiges JSON-Format: Erwartete Schlüssel 'Stadt' und mindestens ein Jahr fehlen.")

                # Durchläuft die Stadt-Daten in der JSON-Datei und extrahiert Informationen
                city = city_data.get("Stadt", "")

                # Fügt nur die Prozentsätze der Liste hinzu, wenn der Schlüssel eine Zahl (Jahr) ist
                percentages = [float(value.replace(",", ".")) if value != "" else None for key, value in
                               city_data.items() if key.isdigit()]
                header_data = list(city_data.keys())

                # Entfernt "Stadt" aus der Liste der Schlüssel
                header_data.remove("Stadt")

                # Fügt die extrahierten Daten für die aktuelle Stadt/Landkreis zur Liste der Daten hinzu
                data.append({'city': city, 'percentages': percentages})

            return title, header_data, data, f_ext


class Application(tk.Tk):
    """
    Die Hauptanwendungs-Klasse für das GUI-Programm.

    Diese Klasse erstellt und verwaltet das Hauptfenster der Anwendung, in dem die GUI-Elemente angezeigt werden.
    Sie ermöglicht das Laden von Daten, Erstellen von Plots und Durchführen von Aktionen über die GUI-Schaltflächen.

    Methoden:
        create_widgets(): Erstellt die GUI-Elemente der Anwendung.
        setup_buttonframe(): Konfiguriert den Button-Bereich der GUI mit den entsprechenden Schaltflächen.
        setup_labelframe(): Konfiguriert das Label-Fenster zur Anzeige von Informationen.
        setup_plotwindow(): Konfiguriert das Plot-Fenster und die zugehörige Canvas-Fläche.
        plotdata(): Zeigt den Plot der ausgewählten Daten an. Zeigt eine Warnung, falls keine Datei ausgewählt wurde.
        clear(): Löscht den aktuellen Plot.
        show_custom_popup(): Zeigt ein benutzerdefiniertes Pop-up-Fenster mit verschiedenen Optionen.
        open_file(): Öffnet ein Dateiauswahlfenster und aktualisiert das Label mit der ausgewählten Datei.
        on_close(): Wird aufgerufen, wenn das Hauptfenster geschlossen wird. Beendet die Anwendung.
    """

    def __init__(self):
        """
        Initialisiert die Hauptanwendungs-Klasse.
        """
        # Initialisiert die Eltern-Klasse (keine Argumente erforderlich)
        super().__init__()

        # Initialisiert die Klasse "ReadData" als Instanzattribut
        self.data_reader = ReadData()

        # Initialisiert das Plot-Fenster als None
        self.plot_w = None

        # Initialisiert das Label-Widget als None
        self.lab = None

        # Erzeugt die Widgets für die Benutzeroberfläche
        self.create_widgets()

        # Definiert Verhalten beim Schließen des Fensters
        self.protocol("WM_DELETE_WINDOW", self.on_close)

        # Startet die Hauptanwendungs-Schleife ("mainloop")
        self.mainloop()

    def create_widgets(self):
        """
        Erstellt die GUI-Elemente der Anwendung.
        """
        # Fenstertitel und Rahmen für die Benutzeroberfläche
        self.title("Tourismus - Gaeste aus dem Ausland")
        self.masterframe = tk.Frame(bg="white")
        self.masterframe.grid(row=0, column=0, sticky="nsew")

        # Hauptrahmen für die Anwendungsoberfläche
        self.mainframe = tk.Frame(self.masterframe, bg="yellow")
        self.mainframe.grid(row=3, column=0, columnspan=4, sticky="nsew")

        # Richtet Buttons, Labels und Plot-Fenster ein
        self.setup_buttonframe()
        self.setup_labelframe()
        self.setup_plotwindow()

        # Fügt die Toolbar für die Navigation des Plots hinzu
        self.toolbar = NavigationToolbar2Tk(self.plot_w.canvas, self.masterframe, pack_toolbar=False)
        self.toolbar.grid(row=0, column=0, columnspan=4, sticky="nsew")

        # Konfiguriert die Zeilen- und Spaltengewichtungen für das Layout
        self.masterframe.columnconfigure(0, weight=1)
        self.masterframe.rowconfigure(0, weight=0)
        self.masterframe.rowconfigure(1, weight=1)
        self.masterframe.rowconfigure(2, weight=1)
        self.masterframe.rowconfigure(3, weight=1)

        self.columnconfigure(0, weight=1)
        self.rowconfigure(0, weight=1)

    def setup_buttonframe(self):
        """
        Konfiguriert den Button-Bereich der GUI mit den entsprechenden Schaltflächen.
        """
        # Schritt 1: Erstellt einen Rahmen für die Buttons
        buttonframe = tk.Frame(self.masterframe, bg="red")
        buttonframe.grid(row=1, column=0, columnspan=4, sticky="nsew")

        # Definiert die Schriftart und Schriftgröße für die Buttons
        button_font_style = ("Century Gothic", 12, "bold")

        # Schritt 2: Erstellt Buttons für verschiedene Aktionen
        open_button = tk.Button(
            buttonframe,
            text="Auswählen",
            command=lambda: self.data_reader.get_data(self.lab),
            font=button_font_style, bg='LightGoldenrod1'
        )
        plot_button = tk.Button(
            buttonframe,
            text="Darstellen",
            command=self.plotdata,
            font=button_font_style,
            bg='LightSalmon1'
        )
        clear_button = tk.Button(
            buttonframe,
            text="Entfernen",
            command=self.clear,
            font=button_font_style,
            bg='PaleGreen'
        )
        close_button = tk.Button(
            buttonframe,
            text="Schließen",
            command=self.show_custom_popup,
            font=button_font_style,
            bg='LightSkyBlue')

        # Schritt 3: Positioniert die Buttons im Button-Bereich
        open_button.grid(row=0, column=0, sticky="nsew")
        plot_button.grid(row=0, column=1, sticky="nsew")
        clear_button.grid(row=0, column=2, sticky="nsew")
        close_button.grid(row=0, column=3, sticky="nsew")

        # Schritt 4: Konfiguriert die Zeilen- und Spaltengewichtungen im Button-Bereich
        buttonframe.columnconfigure(0, weight=1)
        buttonframe.columnconfigure(1, weight=1)
        buttonframe.columnconfigure(2, weight=1)
        buttonframe.columnconfigure(3, weight=1)
        buttonframe.rowconfigure(0, weight=1)

    def setup_labelframe(self):
        """
        Konfiguriert das Label-Fenster zur Anzeige von Informationen.
        """
        # Rahmen für das Label-Fenster
        labelframe = tk.Frame(self.masterframe, bg="blue")
        labelframe.grid(row=2, column=0, columnspan=4, sticky="nsew")

        # Definiert Schriftart und Schriftgröße für das Label
        label_font_style = ("Century Gothic", 12, "bold")

        # Erstellt ein Label im Labelframe mit leerem Text und der definierten Schriftart
        lab = tk.Label(labelframe, text="", font=label_font_style)
        lab.grid(sticky="nsew")

        # Speichert die Referenz zum Label als Instanzattribut
        self.lab = lab

        # Konfiguriert die Zeilen- und Spaltengewichtungen im Label-Bereich
        labelframe.columnconfigure(0, weight=1)
        labelframe.rowconfigure(0, weight=1)

    def setup_plotwindow(self):
        """
        Konfiguriert das Plot-Fenster und die zugehörige Canvas-Fläche.
        """
        # Erstellt ein Plot-Fenster (Plotwindow-Objekt) im Hauptrahmen
        self.plot_w = Plotwindow(self.mainframe, (8, 6))

        # Positioniert die Canvas-Fläche des Plot-Fensters im Raster der Benutzeroberfläche
        self.plot_w.canvas.get_tk_widget().grid(row=3, column=0, columnspan=4, sticky="nsew")

        # Konfiguriert die Zeilen- und Spaltengewichtungen für den Hauptrahmen
        self.mainframe.columnconfigure(0, weight=1)
        self.mainframe.rowconfigure(3, weight=1)

    def plotdata(self):
        """
        Zeigt den Plot der ausgewählten Daten an.
        Zeigt eine Warnung, falls keine Datei ausgewählt wurde.
        """
        # Überprüft, ob eine Datei ausgewählt wurde
        if not self.data_reader.filename:
            messagebox.showwarning("Warnung", "Bitte wählen Sie zuerst eine Datei aus.")
            return

        # Lädt die Daten und relevanten Informationen aus der ausgewählten Datei
        title, header, data, f_ext = self.data_reader.read_and_format_data()

        # Wählt eine Sequential colormap aus, in diesem Fall "plasma"
        colormap = cm.plasma

        # Ruft die Methode plotxy des Plot-Fensters (plot_w) zur Erstellung und Anzeige des Plots auf
        self.plot_w.plotxy(title, header, data, f_ext, colormap)

    def clear(self):
        """
        Löscht den aktuellen Plot.
        """
        # Ruft die clearplot-Methode des Plot-Fensters (plot_w) zum Entfernen des aktuellen Plots auf
        self.plot_w.clearplot()

    def show_custom_popup(self):
        """
        Zeigt ein benutzerdefiniertes Pop-up-Fenster mit verschiedenen Optionen.
        """
        # Erstellt ein Toplevel-Fenster (Pop-up-Fenster) als Kindfenster des Hauptfensters
        popup_window = tk.Toplevel(self)

        # Legt den Fenstertitel für das Popup fest
        popup_window.title("Schließen")

        # Benutzerdefinierte Schriftart für das Pop-up-Fenster
        popup_font_style = ("Century Gothic", 12, "bold")

        # Schritt 1: Erstellt ein Label-Widget im Pop-up-Fenster zur Anzeige einer Nachricht
        label = tk.Label(popup_window, text="Was möchten Sie tun?", font=popup_font_style)
        label.pack(padx=10, pady=10)

        # Schritt 2: Definiert die Schließfunktion für das Pop-up-Fenster
        def close_program():
            popup_window.destroy()  # Schließt das Pop-up-Fenster
            self.on_close()  # Führt die Schließaktion des Hauptfensters aus

        def open_file_popup():
            popup_window.destroy()  # Schließt das Pop-up-Fenster
            self.open_file()  # Öffnet das Dateiauswahlfenster

        # Schritt 3: Erstellt die Schaltflächen im Pop-up-Fenster mit Befehlen zum Schließen des Programms oder
        # Öffnen einer Datei
        close_button = tk.Button(popup_window,
                                 text="Programm schließen",
                                 command=close_program,  # Ruft die Schließfunktion auf
                                 font=popup_font_style,
                                 bg='Tomato')
        open_button = tk.Button(popup_window,
                                text="Datei öffnen",
                                command=open_file_popup,  # Ruft die Funktion zum Öffnen der Datei auf
                                font=popup_font_style,
                                bg='SpringGreen3')

        # Schritt 4: Positioniert die Schaltflächen im Pop-up-Fenster (rechts und links) mit Abständen
        close_button.pack(side="right", padx=10, pady=10)
        open_button.pack(side="left", padx=10, pady=10)

    def open_file(self):
        """
        Öffnet ein Dateiauswahlfenster und aktualisiert das Label mit der ausgewählten Datei.
        """
        self.data_reader.get_data(self.lab)

    def on_close(self):
        """
        Wird aufgerufen, wenn das Hauptfenster geschlossen wird.
        Beendet die Anwendung.
        """
        self.quit()


# Erstellt eine Instanz der Hauptanwendungs-Klasse und startet die Anwendung,
# wenn die Datei direkt ausgeführt und nicht importiert wird
if __name__ == "__main__":
    app = Application()
