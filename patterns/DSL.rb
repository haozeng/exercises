class Backup
  attr_accessor :backup_directory, :interval
  attr_reader :data_sources

  def initialize
    @data_sources = []
    @backup_directory = '/backup'
    @interval = 60
    yield(self) if block_given?
    PackRat.instance.register_backup(self)
  end

  def backup(dir, finder_expression=All.new)
    @data_sources << DataSource.new(dir, finder_expression)
  end

  def to(backup_directory)
    @backup_directory = backup_directory
  end

  def interval(minutes)
    @interval = minutes
  end

  def backup_files
    this_backup_dir = Time.new.ctime.tr(' :', '_')
    this_backup_path = File.join(backup_directory, this_backup_dir)
    @data_sources.each { |source| source.backup(this_backup_path) }
  end

  def run
    while true
      backup_files
      sleep(@interval*60)
    end
  end

end


class DataSource
  attr_reader :directory, :finder_expression

  def initialize(directory, finder_expression)
    @directory = directory
    @finder_expression = finder_expression
  end

  def backup(backup_directory)
    files = @finder_expression.evaluate(@directory)
    files.each do |file|
      backup_file(file, backup_directory)
    end
  end

  def backup_file(path, backup_directory)
    copy_path = File.join(backup_directory, path)
    FileUtils.mkdir_p(File.dirname(copy_path))
    FileUtils.cp(path, copy_path)
  end
end

class PackRat
  include Singleton

  def initialize
    @backups = []
  end

  def register_backup(backup)
    @backups << backup
  end

  def run
    threads = []
    @backups.each do |backup|
      threads << Thread.new { backup.run }
    end
    threads.each { |t| t.join }
  end
end

# backup.pr file
Backup.new do |b|
  b.backup '/home/russ/oldies', file_name('*.map3') | file_name('*.wav')
  b.to '/tmp/backup'
  b.interval 60
end

# User run backup here
eval(File.read('backup.pr'))
PackRat.instance.run
