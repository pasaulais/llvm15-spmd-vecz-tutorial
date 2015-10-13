#define TRIPS 256

kernel void phi_loop(global int *in, global int *out)
{
    size_t tid = get_global_id(0);
    
    int sum = 0;
    for (int i = 0; i < TRIPS; i++)
    {
        sum *= tid;
    }
    
    out[tid] = sum;
}
