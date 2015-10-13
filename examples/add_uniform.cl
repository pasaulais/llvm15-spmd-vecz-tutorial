kernel void add_uniform(global int *dst, global int *src, int alpha) {
    int tid = get_global_id(0);
    dst[tid] = src[tid] + (alpha + 1);
}
