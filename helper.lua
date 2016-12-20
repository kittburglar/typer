helper = {}

function helper.collisionDetection(object1, object2)
	local isCollision =  object1.x < object2.x + object2.width and
   							object1.x + object1.width > object2.x and
   							object1.y < object2.y + object2.height and
   							object1.height + object1.y > object2.y
    return isCollision
end

function helper.randomFloat(lower, greater)
    return lower + math.random()  * (greater - lower);
end