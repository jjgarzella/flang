! Copyright (c) 2004, NVIDIA CORPORATION.  All rights reserved.
!
! Licensed under the Apache License, Version 2.0 (the "License");
! you may not use this file except in compliance with the License.
! You may obtain a copy of the License at
!
!     http://www.apache.org/licenses/LICENSE-2.0
!
! Unless required by applicable law or agreed to in writing, software
! distributed under the License is distributed on an "AS IS" BASIS,
! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
! See the License for the specific language governing permissions and
! limitations under the License.
!
! test host's memory arguments in an internal procedure
!

module foo
  contains 
    subroutine sub(result,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14)
      integer result(:)
      integer d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14
      integer l1
      l1 = 25
      call csub
    contains
      subroutine csub()
	result(1) = d1
	result(2) = d2
	result(3) = d3
	result(4) = d4
	result(5) = d5
	result(6) = d6
	result(7) = d7
	result(8) = d8
	result(9) = d9
	result(10) = d10
	result(11) = d11
	result(12) = d12
	result(13) = d13
	result(14) = d14
	result(15) = l1
      end subroutine
    end subroutine
end module
  
program p
use foo
  integer result(15)
  integer expect(15)
  data expect/ 11,12,13,14,15,16,17,18,19,20,21,22,23,24,25/

  call sub(result,11,12,13,14,15,16,17,18,19,20,21,22,23,24)
  call check(result,expect,15)
end
  
