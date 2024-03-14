class Player
    def initialize()

    end

    def choose_square()
        while true do
            str = gets().chomp()
            num = str.to_i()
            if num <= 9 and num >= 1 then
                return num                
            end
            puts("Invalid input. Plaese enter a valid square number")
        end
    end
end

class Game
    attr_accessor :player1, :player2, :grid, :game_finished, :player_won
    
    def initialize()
        @player1 = Player.new()
        @player2 = Player.new()

        @grid = Array.new(9, nil)

        @game_finished = false

        @player_won = nil

        self.draw_game()
        self.play()
    end

    def play()
        while not self.game_finished do
            # Player one turn
            while not self.game_finished do
                puts("Player 1 turn. Enter a valid square number")
                choice = self.player1.choose_square()
                if self.grid[choice - 1] != nil then
                    puts("Square is already occupied. Please choose an empty square")
                    next
                end
                self.populate_grid(choice, "x")
                
                self.draw_game()
                self.check_game()
                break
            end

            # Player two turn
            while not self.game_finished do
                puts("Player 2 turn. Enter a valid square number")
                choice = self.player1.choose_square()
                if self.grid[choice - 1] != nil then
                    puts("Square is already occupied. Please choose an empty square")
                    next
                end
                self.populate_grid(choice, "o")
                
                self.draw_game()
                self.check_game()
                break
            end
        end

        if self.player_won then
            if self.player_won == 1 then
                puts("Player one won the game")
            elsif self.player_won == 0 then
                puts("Player two won the game")
            end
            return
        end

        puts("Game is a draw")
    end
    
    def populate_grid(choice, player)
        if player == "x" then
            self.grid[choice - 1] = 1
        elsif player == "o" then
            self.grid[choice - 1] = 0
        end
    end

    def check_game()
        # Check rows
        for i in 0..2 do
            if self.grid[i * 3] == self.grid[i * 3 + 1] and self.grid[i * 3] == self.grid[i * 3 + 2] and self.grid[i * 3] != nil then
                self.player_won = self.grid[i * 3]
                self.game_finished = true
                return
            end
        end
        
        # Check columns
        for i in 0..2 do
            if self.grid[i] == self.grid[i + 3] and self.grid[i] == self.grid[i + 6] and self.grid[i] != nil then
                self.player_won = self.grid[i]
                self.game_finished = true
                return
            end
        end

        # Check diagonals
        if self.grid[0] == self.grid[4] and self.grid[0] == self.grid[8] and self.grid[0] != nil then
            self.player_won = self.grid[0]
            self.game_finished = true
            return
        end

        if self.grid[2] == self.grid[4] and self.grid[2] == self.grid[6] and self.grid[2] != nil then
            self.player_won = self.grid[2]
            self.game_finished = true
            return
        end

        # Check draw
        if self.grid.all?() then
            self.game_finished = true
        end
    end

    def draw_game()
        puts("-------------")
        for row in 0..2 do
            print("|")
            for col in 0..2 do
                char = grid[col + 3*row] == 1 ? "X" : grid[col + 3*row] == 0 ? "O" : col + 3*row + 1
                print(" #{char} |")
            end
            print("\n-------------\n")
        end
    end
end

game = Game.new()
