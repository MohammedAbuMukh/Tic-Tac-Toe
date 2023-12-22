import 'dart:io';
bool winner=false;
bool isXturn=true;
int moveCount =0;

List<String> values =['1','2','3','4','5','6','7','8','9'];
List<String> combinations =['012','084','036','147','246','258','345','678'];



void main(){
generate_board();
get_char();
}


bool check_combination(String combination,String check){
  List<int> numbers = combination.split('').map((item){
    return int.parse(item);
  }).toList();

  bool match = false;

  for(final item in numbers){
    if(values[item] == check){
      match = true;
    }
    else{
      match= false;
      break;
    }
  }

  return match;
}


void check_winner(player){
  for(final item in combinations){
    bool combination_validity = check_combination(item,player);
    if(combination_validity == true){
      print('$player WON .....' );
      winner =true;
      break;
    }
  }
}


void get_char(){
  print("choose number for ${isXturn == true ? 'X' : 'O'}");
  int number = int.parse(stdin.readLineSync()!);
  values[number - 1] = isXturn ? 'X' : 'O';
  isXturn= !isXturn;
  moveCount++;
  
  if(moveCount == 9){
    winner= true;
    print("DRAW .....");
  }
  else{
    generate_board();
  }

  check_winner('X');
  check_winner('O');


  if(winner == false) get_char();
}

void generate_board(){
  print('|  |   |   |');
  print('|${values[0]} | ${values[1]} | ${values[2]} | ');
  print('|__|___|___|');
  print('|  |   |   |');
  print('|${values[3]} | ${values[4]} | ${values[5]} | ');
  print('|__|___|___|');
  print('|  |   |   |');
  print('|${values[6]} | ${values[7]} | ${values[8]} | ');
  print('|__|___|___|');
  
}