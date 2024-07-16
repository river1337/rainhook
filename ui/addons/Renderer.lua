local Renderer = {DrawList = {}}

    function Renderer:FindExistingShape(name)
        local Shape = self.DrawList[name]
        if Shape then
            return Shape
        else
            return nil
        end
    end

    function Renderer:Unrender(name_table)
        for _, v in pairs(name_table) do
            local Shape = self:FindExistingShape(v)
        
            if Shape then
                Shape.Visible = false
                Shape:Remove()
            end

            self.DrawList[v] = nil
        end
    end

    function Renderer:UnrenderAll()
        for Name, Shape in pairs(self.DrawList) do
            if Shape then
                Shape.Visible = false
                Shape:Remove()
            end

            self.DrawList[v] = nil
        end
    end

    function Renderer:UnrenderAllExcept(exclude_table)
        for Name, Shape in pairs(self.DrawList) do
            local ShouldContinue = false

            for _, Exclude in pairs(exclude_table) do
                if Exclude == Name then
                    ShouldContinue = true
                    break
                end
            end

            if ShouldContinue then
                ShouldContinue = false
                continue
            end

            if Shape then
                Shape.Visible = false
                Shape:Remove()
            end
    
            self.DrawList[Name] = nil
        end
    end

    function Renderer:Rectangle(name, position, size, color)
        local Shape = self:FindExistingShape(name)
        
        if Shape then
            Shape.Visible = true
            Shape.Position = position
            Shape.Size = size
            Shape.Color = color
            Shape.Transparency = 1
            Shape.Filled = false
        else
            Shape = Drawing.new("Square")
            Shape.Visible = true
            Shape.Position = position
            Shape.Size = size
            Shape.Color = color
            Shape.Transparency = 1
            Shape.Filled = false
            
            self.DrawList[name] = Shape
        end
        
        return Shape
    end

    function Renderer:FilledRectangle(name, position, size, color)
        local Shape = self:FindExistingShape(name)
        
        if Shape then
            Shape.Visible = true
            Shape.Position = position
            Shape.Size = size
            Shape.Color = color
            Shape.Transparency = 1
            Shape.Filled = true
        else
            Shape = Drawing.new("Square")
            Shape.Visible = true
            Shape.Position = position
            Shape.Size = size
            Shape.Color = color
            Shape.Transparency = 1
            Shape.Filled = true

            self.DrawList[name] = Shape
        end
        
        return Shape
    end

    function Renderer:Circle(name, position, radius, color)
        local Shape = self:FindExistingShape(name)
        
        if Shape then
            Shape.Visible = true
            Shape.Position = position
            Shape.Radius = radius
            Shape.Color = color
            Shape.Transparency = 1
            Shape.Filled = false
        else
            Shape = Drawing.new("Circle")
            Shape.Visible = true
            Shape.Position = position
            Shape.Radius = radius
            Shape.Color = color
            Shape.Transparency = 1
            Shape.Filled = false
            
            self.DrawList[name] = Shape
        end
        
        return Shape
    end

    function Renderer:FilledCircle(name, position, radius, color)
        local Shape = self:FindExistingShape(name)
        
        if Shape then
            Shape.Visible = true
            Shape.Position = position
            Shape.Radius = radius
            Shape.Color = color
            Shape.Transparency = 1
            Shape.Filled = true
        else
            Shape = Drawing.new("Circle")
            Shape.Visible = true
            Shape.Position = position
            Shape.Radius = radius
            Shape.Color = color
            Shape.Transparency = 1
            Shape.Filled = true
            
            self.DrawList[name] = Shape
        end
        
        return Shape
    end

    function Renderer:Line(name, from, to, color, thickness)
        local Shape = self:FindExistingShape(name)
        
        if Shape then
            Shape.Visible = true
            Shape.From = from
            Shape.To = to
            Shape.Color = color
            --Shape.Thickness = thickness
            Shape.Transparency = 1
        else
            Shape = Drawing.new("Line")
            Shape.Visible = true
            Shape.From = from
            Shape.To = to
            Shape.Color = color
            --Shape.Thickness = thickness
            Shape.Transparency = 1
            
            self.DrawList[name] = Shape
        end
        
        return Shape
    end

    function Renderer:Text(name, position, text, color, size, font)
        local Shape = self:FindExistingShape(name)
        
        if Shape then
            Shape.Visible = true
            Shape.Position = position
            Shape.Text = text
            Shape.Color = color
            Shape.Size = size
            Shape.Font = font
            Shape.Transparency = 1
        else
            Shape = Drawing.new("Text")
            Shape.Visible = true
            Shape.Position = position
            Shape.Text = text
            Shape.Color = color
            Shape.Size = size
            Shape.Font = font
            Shape.Transparency = 1
            
            self.DrawList[name] = Shape
        end
        
        return Shape
    end

    return Renderer
