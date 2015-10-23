; ModuleID = 'kernel.opencl'
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spir64-unknown-unknown"

; Function Attrs: nounwind
define spir_kernel void @copy_if_even_item_phi(i32 addrspace(1)* %in, i32 addrspace(1)* %out) #0 {
entry:
  %call = call spir_func i64 @_Z13get_global_idj(i32 0) #2
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
  %call = call spir_func i64 @_Z13get_global_idj(i32 0) #2
  %and = and i64 %call, 1
  %cmp = icmp eq i64 %and, 0
  %not_cmp = xor i1 %cmp, true
  br label %if.then

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds i32, i32 addrspace(1)* %in, i64 %call
  %0 = call i32 @__vecz_b_masked_load4_jPU3AS1jb(i32 addrspace(1)* %arrayidx, i1 %cmp)
  br label %if.end

if.end:                                           ; preds = %if.then
  %storemerge = phi i32 [ %0, %if.then ], [ -1, %entry ]
  %1 = select i1 %cmp, i32 %0, i32 undef
  %2 = select i1 %not_cmp, i32 -1, i32 %1
  %entryMask_if.end = or i1 %cmp, %not_cmp
  %arrayidx1 = getelementptr inbounds i32, i32 addrspace(1)* %out, i64 %call
  call void @__vecz_b_masked_store4_jPU3AS1jb(i32 %2, i32 addrspace(1)* %arrayidx1, i1 %entryMask_if.end)
  ret void
}

declare void @__vecz_b_masked_store4_jPU3AS1jb(i32, i32 addrspace(1)*, i1)

declare i32 @__vecz_b_masked_load4_jPU3AS1jb(i32 addrspace(1)*, i1)

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="0" "stackrealign" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="0" "stackrealign" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin nounwind }

!opencl.kernels = !{!0}
!llvm.ident = !{!6}

!0 = !{void (i32 addrspace(1)*, i32 addrspace(1)*)* @copy_if_even_item_phi, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 1, i32 1}
!2 = !{!"kernel_arg_access_qual", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"int*", !"int*"}
!4 = !{!"kernel_arg_base_type", !"int*", !"int*"}
!5 = !{!"kernel_arg_type_qual", !"", !""}
!6 = !{!"clang version 3.8.0 "}
