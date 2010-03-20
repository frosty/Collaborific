module FicsHelper
  def wrap_in_paragraphs(content)
    split_content = content.split("\r\n\r\n")
    split_content.map! {|c| "<p>#{c}</p>\n"}
    split_content.join("").gsub!("\r\n","<br/>\n")
  end
end