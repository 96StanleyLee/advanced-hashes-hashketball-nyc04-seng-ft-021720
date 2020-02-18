require 'pry'

def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
            colors: ['Purple','Turquoise'],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
            colors: ['Black','White'],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] }
  }
end


def num_points_scored(player_name)
   player_points = 0
   game_hash.each do |location, team|
     team[:players].each do |player|
           if player[:player_name] == player_name
             player_points = player[:points]
           end
           end
         end
       player_points
     end

     def shoe_size(player_name)
       shoe_size = 0
       name = ""
       game_hash.each do |location, team|
         team[:players].each do |player|
           if player[:player_name] == player_name
             shoe_size = player[:shoe]
             name = player[:player_name]
           end
           end
         end
       shoe_size
     end

     def team_colors(team_name)
       team_color = ""
      game_hash.each do |location, teams|
        if team_name == teams[:team_name]
          team_color = teams[:colors]
        end
      end
      team_color
     end

def team_names
  array = []
  game_hash.each do |x,y|
    array.push(y[:team_name])
  end
  array
end

def player_numbers(team_name)
  array = []
  game_hash.each do |location, data|
  if data[:team_name] == team_name
    data[:players].each do |players|
      array.push(players[:number])
    end
  end
end
array
end

def player_stats(sought_player_name)
  stats = {}
  game_hash.each do |location,teams|
  teams[:players].each do |player|
    if sought_player_name == player[:player_name]
      stats = player
      stats.delete(:player_name)
    end
  end
end
 stats
end

def big_shoe_rebounds
  shoe = 0
  rebounds = 0
  game_hash.each do |location,teams|
    teams[:players].each do |stats|
      if stats[:shoe] > shoe
        rebounds = stats[:rebounds]
        shoe = stats[:shoe]
      end
    end
  end
  rebounds
end

# # Bonus Questions

# # Since there are multiple bonus questions that ask me
# # to return the name of a player with the most of some stat, I can use the following methods
# # to DRY (don't repeat yourself) up my code.

def iterate_through_players_for(name,statistic)
  game_hash.each do |location, team|
    team[:players].each do |players|
      if players[:player_name] == name
        return players[statistic]
      end
    end
  end
end
def player_with_most_of(statistic)

player_name = ""
statistic_count = 0
player_name_length = ""
game_hash.each do |location, team|
  team[:players].each do |stats|
    if stats[statistic].is_a? String
      if stats[statistic].length > player_name.length
        player_name = stats[statistic]
      end
    else 
      if stats[statistic] > statistic_count
      player_name = stats[:player_name]
      statistic_count = stats[statistic]
      end
    end 
  end
end
player_name
end


def most_points_scored
  player_with_most_of(:points)
end

def winning_team
  # Set up a hash to keep track of the points scored by each team. This way, we
  # can iterate through each player, get their points scored, and increase the
  # count in the hash.

home_score = 0
game_hash[:home][:players].each do |players|
  home_score += (players[:points])
end

away_score = 0
game_hash[:away][:players].each do |players|
  away_score += (players[:points])
end

name = ""
  if home_score>away_score
  name = game_hash[:home][:team_name]
  else
  name = game_hash[:away][:team_name]
  end
name
end

def player_with_longest_name
player_with_most_of(:player_name)
end

# # Super Bonus Question

def long_name_steals_a_ton?
  player_with_most_of(:steals) == player_with_longest_name
end
