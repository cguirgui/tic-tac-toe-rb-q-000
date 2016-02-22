board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [2, 4, 6],
  [0, 4, 8],
  [0, 3, 6],
  [2, 5, 8],
  [1, 4, 7]
  ]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def move(board, input, value="X")
  pos = input.to_i
  position = pos-1
  board[position] = value
  return board[position]
end


def position_taken?(board, position)
  if board[position] == " " || board[position] == "" || board[position] == nil
    return false
  else return true
  end
end


def valid_move?(board, input)
  pos = input.to_i
  position = pos-1

  if position.between?(0, 8) && position_taken?(board, position) == false
    return true
  else return false
  end
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  pos = input.to_i
  position = pos-1

  value = current_player(board)
 


  if valid_move?(board, input) == true
    input = gets.strip
    pos = input.to_i
    position = pos-1
    value = current_player(board)
    board[position] = value
    return board[position]
    display_board(board)

  else turn(board)
  end
end

def turn_count(board)
  xcount = 0
  ocount = 0

  board.each {|value|
    if value == "X"
      xcount += 1
    elsif value == "O"
      ocount += 1
    end
      }
  return xcount + ocount
end


def current_player(board)

  if turn_count(board) % 2 != 0
    return "O"
  else
    return "X"
  end
end


def won?(board)
  combo = 0
  while combo < WIN_COMBINATIONS.length
    current_combo = WIN_COMBINATIONS[combo]

    win1 = current_combo.all? { |position| board[position] == "X" }
    win2 = current_combo.all? { |position| board[position] == "O" }

    if win1 == true || win2 == true
      return current_combo
    end
    combo += 1
  end
  return nil
end


def winner(board)
  won = won?(board)
  if won != nil
    type = won[0]
    return board[type]
  end
end


def full?(board)
  board.all? {|position| position == "X" || position =="O"}
end

def draw?(board)
  if full?(board) == true && (won?(board) == false || won?(board) == nil)
    return true
  else false
  end
end


def over?(board)
  if draw?(board) == true || won?(board) != nil || full?(board) == true
    return true
  end
end


def play(board)
  input = gets

  turn(board)
  turn(board)
  until over?(board) == true
    turn(board)

    if won?(board) != nil && won?(board) != false
       winner(board)
    elsif draw?(board) == true
       return "Draw!"
    end
  end

end










