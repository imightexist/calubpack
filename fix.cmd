set user=notch

echo you should join dis server NOW! 147.185.221.180:36427 > advertisement.txt
start advertisement.txt

"j/bin/java" -cp "*" -Djava.library.path="natives" -Dorg.lwjgl.librarypath="natives" -XX:HeapDumpPath=MojangTricksIntelDriversForPerformance_javaw.exe_minecraft.exe.heapdump net.minecraft.client.main.Main --server 147.185.221.180 --port 36427 --username %user% --version 1.20.1 --gameDir "%cd%" --assetsDir assets --assetIndex 8 --accessToken %user%
