
#imortowanie danych
dane <- read.csv("C:\\Users\\alicj\\Desktop\\Spotify_YouTube.csv")
print(dane)
names(dane)
dim(dane)
summary(dane)
any(is.na(dane))


# stwórz wektor logiczny określający, które wiersze zawierają braki danych
wiersze_z_brakami <- apply(is.na(dane), 1, any)

# stwórz nową tabelę zawierającą tylko wiersze z brakami danych
dane_z_brakami <- dane[wiersze_z_brakami, ]

# wyodrębnij rekordy bez braków
complete_cases <- complete.cases(dane)

# stwórz nowy zbiór danych z rekordami bez braków
dane_complete <- dane[complete_cases, ]

stream <- dane_complete$Stream

hist(stream, col = "blue", main = "Rozkład zmiennej Stream", breaks=100)
summary(stream)
table(cut(stream, breaks=100))
liczba_wierszy <- sum(stream <6.77e+07)
print(liczba_wierszy)


binary_stream <- rep(0, length(dane_complete$X))
dane_complete$Binary_stream <- binary_stream
dane_complete$Binary_stream[dane_final$Stream > 6.77e+07] <- 1
table(dane_complete$Binary_stream)


# Zamieniam wartości "true" i "false" w kolumnie "Licensed" na typ logiczny
dane_complete$Licensed_logical <- as.logical(dane_complete$Licensed)

# Zamieniam wartości logiczne na 0 lub 1 )
dane_complete$Licensed_binary <- as.numeric(dane_complete$Licensed_logical)

# Zamieniam wartości "true" i "false" w kolumnie "Licensed" na typ logiczny
dane_complete$official_video_logical <- as.logical(dane_complete$official_video)

# Zamieniam wartości logiczne na 0 lub 1 )
dane_complete$official_video_binary <- as.numeric(dane_complete$official_video_logical)

# Zastępuje kolumnę "Album_type" wartościami binarnymi w nowej kolumnie "Binary_album"
dane_complete$Binary_album <- ifelse(dane_complete$Album_type == "album", 0, 1)


#wybieram jedynie potrzebne kolumny
dane_final <- subset(dane_complete, select = c("Artist", "Track", "Album", "Binary_album", "Danceability", 
                                 "Energy", "Key", "Loudness", "Speechiness" , 
                                 "Acousticness", "Instrumentalness", "Liveness", "Valence", 
                                 "Tempo", "Duration_ms", "Views", "Likes", "Comments",  
                                 "Licensed_binary", "official_video_binary", "Binary_stream"))




write.csv(dane_final, file = "spotify_youtube_new.csv", row.names = FALSE)
write.csv(dane_z_brakami, file = "spotify_youtube_braki.csv", row.names = FALSE)


