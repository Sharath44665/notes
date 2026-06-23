# dart Notes

``` dart
late List<int> userSelected;

void somefunction(){
   userSelected = List.filled(total, -1); // assume total = 3,
   print(userSelected) // [-1, -1, -1]
}
```