module MaRuKu; module Out; module HTML
        def to_html_table
                align = self.align
                num_columns = align.size

                head = @children.slice(0, num_columns)
                rows = []
                i = num_columns
                while i<@children.size
                        rows << @children.slice(i, num_columns)
                        i += num_columns
                end

                table = create_html_element('table')
                        thead = Element.new 'thead'
                        tr = Element.new 'tr'
                                array_to_html(head).each do |x| tr<<x end
                        thead << tr
                        table << thead

                        tbody = Element.new 'tbody'
                        rows.each do |row|
                                tr = Element.new 'tr'
                                        array_to_html(row).each_with_index do |x,i|
                                                attributes['style'] ="text-align: #{align[i].to_s};"
                                                tr<<x
                                        end

                                tbody << tr << Text.new("\n")
                        end
                        table << tbody
		table.attributes['class'] = 'table table-striped'
                table
                
        end 
end
end
end

