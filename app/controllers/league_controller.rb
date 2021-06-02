class LeagueController < ApplicationController
  def club_stat
    @championships = Championship.all
    champ = params[:cham_id] || ""
    @clubs = Clubs.call(champ)
    respond_to do |format|
      format.html
      format.json { render json: @clubs }
    end
  end

  def champ_stat
    champ = params[:champ] || ""
    @years = [2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021]
    @championships = Championship.all    
  end

  def club_info
    @club = params[:club]
    @league = Championship.find_by_cham_id(params[:champ])
    @info = Team.find_by_sql("
      SELECT pl.name as player, pl.t_num as number, c.name as country
      FROM players pl 
      INNER JOIN countries c ON pl.country_id=c.country_id
      INNER JOIN teams t ON t.team_id=pl.team_id
      WHERE t.name='#{@club}'
    ")
  end

  def matches
    @championships = Championship.all
    champ = params[:cham_id] || ""
    p team = params[:team] || ""
    @clubs = Clubs.call(champ)
    unless champ.empty? && team.empty?
      @games = Game.find_by_sql("
        SELECT g.game_id, t1.name as home, st1.goals||':'||st2.goals as tablo, t2.name as away, 
                          ch.champ as champ, a.name as stadium, g.game_date 
        FROM games g 
          INNER JOIN arenas a ON a.stadium_id=g.stadium_id 
          INNER JOIN championships ch ON g.cham_id=ch.cham_id 
          INNER JOIN statistics st1 ON g.game_id=st1.game_id and g.team_h=st1.team_id and 
                                       g.cham_id=st1.champ_id 
          INNER JOIN statistics st2 ON g.game_id=st2.game_id and g.team_a=st2.team_id and 
                                       g.cham_id=st2.champ_id 
          INNER JOIN teams t1 ON t1.team_id=g.team_h and t1.stadium_id=g.stadium_id 
          INNER JOIN teams t2 ON t2.team_id=g.team_a
        WHERE g.cham_id='#{champ}' and (g.team_h='#{team}' or g.team_a='#{team}')
      ")
    end
    respond_to do |format|
      format.html
      format.json { render json: @clubs }
    end
  end

  def countries
    @stadiums = Arena.find_by_sql("
      SELECT ar.name as name, ar.capacity, c.name as city_name
      FROM arenas ar 
        INNER JOIN cities c ON ar.city_id=c.city_id
    ")
  end

  def home
  end

  def cham_info
    @lig_id = params[:league]
    @clubs = Team.find_by_sql("
      SELECT t.id AS id, t.name AS club, st.stadium AS stadium, st.city AS city 
      FROM teams t,
        (SELECT a.stadium_id AS stadium_id, a.name AS stadium, c.name AS city 
        FROM arenas a, cities c
        WHERE a.city_id = c.city_id) st
      WHERE t.cham_id = '#{@lig_id}' and t.stadium_id = st.stadium_id
    ")
  end

  def find_by_champ
    @league = params[:champ]
    @stat = Statistic.find_by_sql("
      SELECT SUM(st.goals) as goals, SUM(st.shots) AS shots, 
              SUM(st.fouls) as fouls, extract('year' from g.game_date) as year
      FROM statistics st
      INNER JOIN games g 
        ON g.game_id=st.game_id and (g.team_h=st.team_id or g.team_a=st.team_id) 
                                and g.cham_id=st.champ_id
      WHERE st.champ_id='#{@league}'
      GROUP BY 4
    ")
    respond_to do |format|
      format.html
      format.js
      format.json {render json: @stat}
    end
  end

  def find_club_stat
    @champ = params[:champ]
    team = params[:team]
    @club_stat = Statistic.find_by_sql("
      SELECT SUM(st.goals) as goals, SUM(st.shots) as shots, SUM(st.fouls) as fouls, 
              extract('year' from g.game_date) as year
      FROM statistics st
      INNER JOIN games g 
        ON g.game_id=st.game_id and st.champ_id=g.cham_id and 
          (g.team_h=st.team_id or g.team_a=st.team_id)
      WHERE st.team_id='#{team}' and g.cham_id='#{@champ}'
      GROUP BY 4
    ")
    @club = Team.find_by_team_id(team)
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @club_stat }
    end
  end
end
