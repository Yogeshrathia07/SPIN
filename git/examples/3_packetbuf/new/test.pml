proctype packetbuf_hdralloc() {
    printf("Executing packetbuf_hdralloc\n");
}

proctype packetbuf_hdrreduce() {
    printf("Executing packetbuf_hdrreduce\n");
}

proctype packetbuf_copyfrom() {
    printf("Executing packetbuf_copyfrom\n");
}

proctype packetbuf_copyto() {
    printf("Executing packetbuf_copyto\n");
}

init {
    atomic {
        do
        :: run packetbuf_hdralloc()
        :: run packetbuf_hdrreduce()
        :: run packetbuf_copyfrom()
        :: run packetbuf_copyto()
        :: break
        od
    }
}
