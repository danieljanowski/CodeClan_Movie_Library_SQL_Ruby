require_relative('../db/sql_runner')
require_relative('star')
require_relative('casting')

class Movie

  attr_accessor :title, :genre, :budget
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget'].to_i
  end

  def save
    sql = "INSERT INTO movies
          (
            title,
            genre,
            budget
          )
          VALUES
          ($1, $2, $3)
          RETURNING id"
    values = [@title, @genre, @budget]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def stars
    sql = "SELECT stars.* FROM stars
          INNER JOIN castings
          ON castings.star_id = stars.id
          WHERE movie_id = $1"
    values = [@id]
    stars = SqlRunner.run(sql, values)
    result = stars.map{|star| Star.new(star)}
    return result
  end

  def update
    sql = "UPDATE movies SET
          (
            title,
            genre
            ) =
            ($1, $2)
            WHERE id = $3"
      values = [@title, @genre, @id]
      SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM movies WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def remaining_budget
    sql = "SELECT SUM(fee) FROM castings WHERE movie_id = $1"
    values = [@id]
    result_hash = SqlRunner.run(sql, values).first
    return result_hash['sum'].to_i
  end

  def self.all
      sql = "SELECT * FROM movies"
      movies = SqlRunner.run(sql)
      result = movies.map {|movie| Movie.new(movie)}
      return result
  end

  def self.delete_all
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

end
