class Clubs < BaseInteractor
  def call(leag)
    clubs = Game.find_by_sql("
      SELECT DISTINCT t.team_id, t.name
      FROM games g
      INNER JOIN teams t ON t.team_id=g.team_h or t.team_id=g.team_a
      WHERE g.cham_id='#{leag}'
    ")
  end
end