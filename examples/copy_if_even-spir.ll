; ModuleID = 'kernel.opencl'
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spir64-unknown-unknown"

; Function Attrs: nounwind
define spir_kernel void @copy_if_even_item_phi(i32 addrspace(1)* %in, i32 addrspace(1)* %out) #0 {
entry:
  %call = call spir_func i64 @_Z13get_global_idj(i32 0) #3
  %and = and i64 %call, 1
  %cmp = icmp eq i64 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds i32, i32 addrspace(1)* %in, i64 %call
  %0 = load i32, i32 addrspace(1)* %arrayidx, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %storemerge = phi i32 [ %0, %if.then ], [ -1, %entry ]
  %arrayidx1 = getelementptr inbounds i32, i32 addrspace(1)* %out, i64 %call
  store i32 %storemerge, i32 addrspace(1)* %arrayidx1, align 4
  ret void
}

declare spir_func i64 @_Z13get_global_idj(i32) #1

; Function Attrs: nounwind
define spir_kernel void @__vecz_v4_copy_if_even_item_phi(i32 addrspace(1)* %in, i32 addrspace(1)* %out) #0 {
entry:
  %call = call spir_func i64 @_Z13get_global_idj(i32 0) #3
  %.splatinsert = insertelement <4 x i64> undef, i64 %call, i32 0
  %.splat = shufflevector <4 x i64> %.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  %0 = add <4 x i64> %.splat, <i64 0, i64 1, i64 2, i64 3>
  %and1 = and <4 x i64> %0, <i64 1, i64 1, i64 1, i64 1>
  %cmp2 = icmp eq <4 x i64> %and1, zeroinitializer
  br label %if.then

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds i32, i32 addrspace(1)* %in, i64 %call
  %1 = call <4 x i32> @__vecz_b_masked_load4_Dv4_jPU3AS1jDv4_b(i32 addrspace(1)* %arrayidx, <4 x i1> %cmp2) #4
  br label %if.end

if.end:                                           ; preds = %if.then
  %2 = select <4 x i1> %cmp2, <4 x i32> %1, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>
  %arrayidx1 = getelementptr inbounds i32, i32 addrspace(1)* %out, i64 %call
  %3 = bitcast i32 addrspace(1)* %arrayidx1 to <4 x i32> addrspace(1)*
  store <4 x i32> %2, <4 x i32> addrspace(1)* %3, align 4
  ret void
}

declare i32 @_Z3anyDv4_i(<4 x i32>)

define <4 x i32> @__vecz_b_masked_load4_Dv4_jPU3AS1jDv4_b(i32 addrspace(1)*, <4 x i1>) {
entry:
  %2 = bitcast i32 addrspace(1)* %0 to <4 x i32> addrspace(1)*
  %3 = addrspacecast <4 x i32> addrspace(1)* %2 to <4 x i32>*
  %4 = call <4 x i32> @llvm.masked.load.v4i32(<4 x i32>* %3, i32 4, <4 x i1> %1, <4 x i32> undef)
  ret <4 x i32> %4
}

; Function Attrs: nounwind readonly argmemonly
declare <4 x i32> @llvm.masked.load.v4i32(<4 x i32>*, i32, <4 x i1>, <4 x i32>) #2

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="0" "stackrealign" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="0" "stackrealign" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly argmemonly }
attributes #3 = { nobuiltin nounwind }
attributes #4 = { nounwind }

!opencl.kernels = !{!0}
!llvm.ident = !{!6}

!0 = !{void (i32 addrspace(1)*, i32 addrspace(1)*)* @copy_if_even_item_phi, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 1, i32 1}
!2 = !{!"kernel_arg_access_qual", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"int*", !"int*"}
!4 = !{!"kernel_arg_base_type", !"int*", !"int*"}
!5 = !{!"kernel_arg_type_qual", !"", !""}
!6 = !{!"clang version 3.8.0 "}
