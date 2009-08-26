namespace :objectives do
  desc "Add Objectives to application"
  task :add_objectives => :environment do


    
    #Arts
    subject = Subject.find_or_create_by_name "arts"
    #A
    oc = subject.criterions.create!(:category=>"A", :title=>"AAA")
    oc.objectives.create!(:subcategory=>"1", :description=>"Demonstrate knowledge and understanding of the art forms studied in relation to societal, cultural, historical and personal contexts")
    oc.objectives.create!(:subcategory=>"2", :description=>"Demonstrate knowledge and understanding of the elements of the art form studied, including specialized language, concepts and processes")
    oc.objectives.create!(:subcategory=>"3", :description=>"Communicate a critical understanding of the art form studied in the context of thir own artwork")
    #B
    oc = subject.criterions.create!(:category=>"B", :title=>"BBB")
    oc.objectives.create!(:subcategory=>"1", :description=>"Develop an idea, theme or personal interpretation to a point of realization, expressing and communicating their artistic intentions")
    oc.objectives.create!(:subcategory=>"2", :description=>"Apply skills, techniques and processes to create, perform and/or present art.")
    #C
    oc = subject.criterions.create!(:category=>"C", :title=>"CCC")
    oc.objectives.create!(:subcategory=>"1", :description=>"Reflect critically on their own artistic development and processes at different stages of their work")
    oc.objectives.create!(:subcategory=>"2", :description=>"Evaluate their work")
    oc.objectives.create!(:subcategory=>"3", :description=>"Use feedback to inform their own artistic development and processes")
    #D
    oc = subject.criterions.create!(:category=>"D", :title=>"DDD")
    oc.objectives.create!(:subcategory=>"1", :description=>"Show commitment in using their own artistic processes")
    oc.objectives.create!(:subcategory=>"2", :description=>"Demonstrate curiosity, self-motivation, initiative and a willingness to take informed risks")
    oc.objectives.create!(:subcategory=>"3", :description=>"Support, encourage and work with their peer in a positive way")
    oc.objectives.create!(:subcategory=>"4", :description=>"Be receptive to art practices and artworks from various cultures, including their own.")
    
    #Language A
    subject = Subject.find_or_create_by_name "language_a"
    #A
    oc = subject.criterions.create!(:category=>"A", :title=>"Content (receptive and productive)")
    oc.objectives.create!(:subcategory=>"1", :description=>"Understand and analyze the language, content, structure, meaning and significance of both familiar and previously unseen oral written and visual texts")
    oc.objectives.create!(:subcategory=>"2", :description=>"Understand and apply language A terminology in context")
    oc.objectives.create!(:subcategory=>"3", :description=>"Analyze the effects of the author's choices on the audience")
    oc.objectives.create!(:subcategory=>"4", :description=>"Compose pieces that apply appropriate literary and/or non-literary features to serve the context and intention")
    oc.objectives.create!(:subcategory=>"5", :description=>"Compare and contrast works, and connect themes across and within genres")
    oc.objectives.create!(:subcategory=>"6", :description=>"Express an informed nad independent response to literary and non-literary texts")
    #B
    oc = subject.criterions.create!(:category=>"B", :title=>"Organization")
    oc.objectives.create!(:subcategory=>"1", :description=>"Create work that employs organizational structures and language-specific conventions throughout a varity of text types")
    oc.objectives.create!(:subcategory=>"2", :description=>"Organize ideas and arguments in a sustained, coherent and logical manner")
    oc.objectives.create!(:subcategory=>"3", :description=>"employ appropriate critical apparatus")
    #C
    oc = subject.criterions.create!(:category=>"C", :title=>"Style and language mechanics")
    oc.objectives.create!(:subcategory=>"1", :description=>"use language to narrate, describe, analyze, explain, argue, persuade, inform, entertain and express feelings")
    oc.objectives.create!(:subcategory=>"2", :description=>"use language accurately")
    oc.objectives.create!(:subcategory=>"3", :description=>"use apropriate and varied register, vocabulary and idiom")
    oc.objectives.create!(:subcategory=>"4", :description=>"Use corrct grammar and syntax")
    oc.objectives.create!(:subcategory=>"5", :description=>"Use appropriate and varies sentence structure")
    oc.objectives.create!(:subcategory=>"6", :description=>"Use correct spelling (alphabetic languages) or writing (character languages)")
    
    #Math
    subject = Subject.find_or_create_by_name "mathematics"
    #A
    oc = subject.criterions.create!(:category=>"A", :title=>"Knowledge and understanding")
    oc.objectives.create!(:subcategory=>1, :description=>"Know and demonstrate understanding of the concepts from the five branches of mathematics (number, algebra, geometry and trigonometry, statistics and probability, and discrete mathematics)")
    oc.objectives.create!(:subcategory=>2, :description=>"Use appropriate mathematical concepts and skills to solve problems in both familiar and unfamiliar situations including those in real-life contexts.")
    oc.objectives.create!(:subcategory=>3, :description=>"Select and apply general rules correctly to solve problems in both familiar and unfamiliar situations including those in real-life contexts.")
    oc.objectives.create!(:subcategory=>4, :description=>"Select and apply general rules correctly to solve problems including those in real-life contexts.")
    #B
    oc =subject.criterions.create!(:category=>"B", :title=>"Investigating patterns")     
    oc.objectives.create!(:subcategory=>1, :description=>"Select and apply appropriate inquiry and mathematical problem-solving techniques.")
    oc.objectives.create!(:subcategory=>2, :description=>"Recognize patterns.")
    oc.objectives.create!(:subcategory=>3, :description=>"Describe patterns as relationships or general rules.")
    oc.objectives.create!(:subcategory=>4, :description=>"Draw conclusions consistent with findings.")
    oc.objectives.create!(:subcategory=>5, :description=>"Develop a critical appreciation of the use of information and communication technology in mathematics.")
    #C
    oc = subject.criterions.create!(:category=>"C", :title=>"Communication in mathematics")     
    oc.objectives.create!(:subcategory=>1, :description=>"Use appropriate mathematical language (notation, symbols, terminology) in both oral and written explanations.")
    oc.objectives.create!(:subcategory=>2, :description=>"Use different forms of mathematical representation (formulae, diagrams, tables, charts, graphs and models).")
    oc.objectives.create!(:subcategory=>3, :description=>"Move between different forms of representation.")
    #D
    oc = subject.criterions.create!(:category=>"D", :title=>"Reflection in mathematics")     
    oc.objectives.create!(:subcategory=>1, :description=>"Explain whether their results make sense in the context of the problem.")
    oc.objectives.create!(:subcategory=>2, :description=>"Explain the importance of their findings.")
    oc.objectives.create!(:subcategory=>3, :description=>"Justify the degree of accuracy of their results where appropriate.")
    oc.objectives.create!(:subcategory=>4, :description=>"Suggest improvements to the method when necessary.")
    
  end

  desc "Run all bootstrapping tasks"
  task :all => [:add_objectives]
end
