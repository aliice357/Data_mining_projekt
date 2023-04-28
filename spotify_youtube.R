

dane <- read.csv("C:\\Users\\alicj\\Desktop\\Spotify_YouTube.csv")
print(dane)
names(dane)
dim(dane)
summary(dane)
any(is.na(dane))

views <- data$Views
stream <- data$Stream
hist(stream)
hist(views, col = "blue", main = "Rozk³ad zmiennej Views")
summary(views)
summary(stream)

binary_stream <- rep(0, length(dane$X))
binary_stream[stream >= 2.0e+08] <- 1

dane$Binary_stream <- binary_stream

# Zamieniam wartoœci "true" i "false" w kolumnie "Licensed" na typ logiczny
dane$Licensed_logical <- as.logical(dane$Licensed)

# Zamieniam wartoœci logiczne na 0 lub 1 )
dane$Licensed_binary <- as.numeric(dane$Licensed_logical)

# Zamieniam wartoœci "true" i "false" w kolumnie "Licensed" na typ logiczny
dane$official_video_logical <- as.logical(dane$official_video)

# Zamieniam wartoœci logiczne na 0 lub 1 )
dane$official_video_binary <- as.numeric(dane$official_video_logical)

# Zastêpuje kolumnê "Album_type" wartoœciami binarnymi w nowej kolumnie "Binary_album"
dane$Binary_album <- ifelse(dane$Album_type == "album", 0, 1)

names(dane)
#usunê kolummny które nie s¹ mi potrzebne do analizy
dane1 <- dane[, c("Artist", "Track", "Album", "Binary_album", "Danceability", 
                  "Energy", "Key", "Loudness", "Speechiness" , 
                  "Acousticness",  "Instrumentalness", "Liveness", "Valence", 
                  "Tempo", "Duration_ms", "Views", "Likes", "Comments",  
                  "New_stream", "Licensed_binary", "official_video_binary")]
table(dane1$New_stream)

write.csv(dane1, file = "spotify_youtube_new.csv", row.names = FALSE)

#instalacja pakietu
install.packages("naniar")
#wczytanie biblioteki
library("naniar")
#imputujemy œredni¹
> kopia_d$credit_amt<-impute_mean(kopia_d$credit_amt)
#sprawdzamy, ¿e imputacja zosta³a wykonana
> any(is.na(kopia_d$credit_amt))
dane$views_binary <- ifelse(dane$Views> 8e+07, 1, 0)


