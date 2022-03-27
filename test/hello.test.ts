import { Hello } from '../src/index'

test('hello', () => {
    expect(new Hello().sayHello('Michael')).toBe('hello Michael my friend')
})