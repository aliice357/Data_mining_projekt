#imortowanie danych
dane <- read.csv("C:\\Users\\alicj\\Desktop\\Spotify_YouTube.csv")
print(dane)
names(dane)
dim(dane)
summary(dane)
any(is.na(dane))

views <- dane$Views
stream <- dane$Stream
hist(stream, col = "blue", main = "Rozkład zmiennej Stream")
summary(stream)

binary_stream <- rep(0, length(dane$X))
binary_stream[stream >= 2.0e+08] <- 1

dane$Binary_stream <- binary_stream

# Zamieniam wartości "true" i "false" w kolumnie "Licensed" na typ logiczny
dane$Licensed_logical <- as.logical(dane$Licensed)

# Zamieniam wartości logiczne na 0 lub 1 )
dane$Licensed_binary <- as.numeric(dane$Licensed_logical)

# Zamieniam wartości "true" i "false" w kolumnie "Licensed" na typ logiczny
dane$official_video_logical <- as.logical(dane$official_video)

# Zamieniam wartości logiczne na 0 lub 1 )
dane$official_video_binary <- as.numeric(dane$official_video_logical)

# Zastępuje kolumnę "Album_type" wartościami binarnymi w nowej kolumnie "Binary_album"
dane$Binary_album <- ifelse(dane$Album_type == "album", 0, 1)

names(dane)
#usunę kolummny które nie są mi potrzebne do analizy
dane1 <- subset(dane, select = c("Artist", "Track", "Album", "Binary_album", "Danceability", 
                                 "Energy", "Key", "Loudness", "Speechiness" , 
                                 "Acousticness", "Instrumentalness", "Liveness", "Valence", 
                                 "Tempo", "Duration_ms", "Views", "Likes", "Comments",  
                                 "Licensed_binary", "official_video_binary", "Binary_stream"))




write.csv(dane1, file = "spotify_youtube_new.csv", row.names = FALSE)



