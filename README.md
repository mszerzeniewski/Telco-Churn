# Telco-Churn
Dashboard w Power BI, który pokazuje, kto odszedł z firmy, ale pozwala także sprawdzić, ile by nas kosztowało zatrzymanie tych, którzy jeszcze są.

Co tu jest zrobione?
Raport podzieliłem na dwie logiczne części:

Analiza historyczna (Góra): Sprawdzam, gdzie ucieka najwięcej ludzi. Użyłem heatmapy, żeby od razu było widać, że połączenie "umowa z miesiąca na miesiąc" + "płatność elektroniczna" to największy problem.

Symulator (Dół): To narzędzie do "zabawy" suwakami. Możesz ustawić, kogo uważasz za klienta wysokiego ryzyka i sprawdzić, o ile spadnie przychód, jeśli dasz mu rabat.

Kluczowe rozwiązania:
Tylko aktywni klienci: W symulacji celowo odfiltrowałem osoby, które już odeszły (is_churn = 1). Liczenie rabatów dla ludzi, których już nie ma, nie ma sensu, więc skupiłem się na realnych pieniądzach, które są jeszcze w firmie.

Logika segmentowa: Ryzyko odejścia liczę dla grup (np. po typie kontraktu), a nie dla pojedynczego klienta.

Wykres bąbelkowy: Pokazuje największe grupy pod ryzykiem. Im wyżej i bardziej w prawo jest kropka, tym bardziej opłaca się tam zadzwonić z ofertą.

Jak to działa? (Parametry What-If):
Próg ryzyka: Ustawiasz suwakiem, od jakiego procentu prawdopodobieństwa odejścia wchodzimy z akcją ratunkową.
Wielkość rabatu: Ustawiasz, ile procent ceny chcesz im uciąć.

Wynik: Dashboard od razu przelicza, ile przychodu uratujesz, a ile "stracisz" na udzielonych zniżkach.

Technologie:
Power BI + DAX (symulacje, parametry, formatowanie warunkowe).

Model danych oparty na popularnym zbiorze IBM Telco.
